import 'dart:developer';

import 'package:balanced_meal/data/constants/strings.dart';
import 'package:balanced_meal/data/models/item.dart';
import 'package:balanced_meal/data/models/order.dart';
import 'package:balanced_meal/data/models/response.dart';
import 'package:balanced_meal/data/repos/order_repo.dart';
import 'package:balanced_meal/modules/models/order_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrderNotifier extends StateNotifier<OrderState> {
  OrderNotifier(this.orderRepo) : super(OrderState()) {
    // fetchOrder();
  }

  OrderRepo orderRepo;

  void initialize() => state = OrderState();

  Future<void> addToOrders(Item item) async {
    List<Order> updatedOrderItems = List.from(state.orderItems);
    Order? existingOrder;

    final existingOrderIndex =
        updatedOrderItems.indexWhere((order) => order.name == item.foodName);
    if (existingOrderIndex != -1) {
      existingOrder = updatedOrderItems[existingOrderIndex];
    }

    if (existingOrder != null && existingOrderIndex != -1) {
      Order updatedExistingOrder = existingOrder.copyWith(
        totalPrice: (existingOrder.totalPrice ?? 0) + (item.price ?? 0),
        quantity: (existingOrder.quantity ?? 0) + 1,
        calories: (existingOrder.calories ?? 0) + (item.calories ?? 0),
      );

      updatedOrderItems[existingOrderIndex] = updatedExistingOrder;
    } else {
      Order newOrder = Order(
        name: item.foodName,
        totalPrice: item.price,
        quantity: 1,
        calories: item.calories,
      );

      //updatedOrderItems.add(newOrder);
      updatedOrderItems = updatedOrderItems..add(newOrder);
    }

    state = state.copyWith(orderItems: updatedOrderItems);
  }

  Future<void> removeOrder(Item itemToRemove) async {
    List<Order> updatedOrderItems = List.from(state.orderItems);
    Order? existingOrder;

    // Find the existing order and its index
    final existingOrderIndex = updatedOrderItems
        .indexWhere((order) => order.name == itemToRemove.foodName);
    if (existingOrderIndex != -1) {
      existingOrder = updatedOrderItems[existingOrderIndex];
    }

    if (existingOrder != null && existingOrderIndex != -1) {
      int currentQuantity = existingOrder.quantity ?? 0; // Default to 0 if null

      if (currentQuantity > 1) {
        // Decrease quantity and adjust total price
        Order updatedOrder = existingOrder.copyWith(
          totalPrice:
              (existingOrder.totalPrice ?? 0.0) - (itemToRemove.price ?? 0),
          quantity: (currentQuantity) - 1,
          calories:
              (existingOrder.calories ?? 0) - (itemToRemove.calories ?? 0),
        );

        updatedOrderItems[existingOrderIndex] = updatedOrder;
      } else {
        // Quantity is 1 (or less, though should be 1 if logic is correct), so remove the order
        updatedOrderItems.removeAt(existingOrderIndex);
      }

      state = state.copyWith(orderItems: updatedOrderItems);
    } else {
      // Order not found, nothing to remove. You might want to log this or handle it.
      log("Attempted to remove an item that's not in the order: ${itemToRemove.foodName}");
    }
  }

  Future<void> sendOrder() async {
    state = state.setLoading(Strings.sendingOrder);

    try {
      final response = await orderRepo.sendOrders(state.orderItems);

      bool result = response['result'];
      log('Result: $result');
      // Update the state with new appointments
      state = state.copyWith(
        response:
            Response.success(Strings.ordersSent, message: 'Result: $result'),
      );
    } catch (e) {
      state = state.copyWith(response: Response.error(e.toString()));
    }
  }
}
