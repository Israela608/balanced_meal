import 'package:balanced_meal/data/models/order.dart';
import 'package:balanced_meal/data/models/response.dart';
import 'package:equatable/equatable.dart';

class OrderState extends Equatable {
  final Response response;
  final List<Order> orderItems;

  bool get isSuccess => response.isSuccess;

  OrderState setLoading(String message) {
    return copyWith(response: Response.loading(message));
  }

  const OrderState({
    this.response = const Response.initial(),
    this.orderItems = const [],
  });

  double get totalCalories {
    if (orderItems.isEmpty) {
      return 0.0;
    }
    return orderItems.fold(0.0, (sum, item) {
      final calories = item.calories ?? 0.0;
      return sum + calories;
    });
  }

  double get totalPriceOfAllOrders {
    if (orderItems.isEmpty) {
      return 0.0;
    }
    return orderItems.fold(0.0, (sum, item) {
      final price = item.totalPrice ?? 0.0;
      return sum + price;
    });
  }

  bool isCaloriesWithinRange(double userCalories) {
    if (userCalories <= 0) {
      return totalCalories ==
          userCalories; // Only true if both are zero or negative and equal
    }
    final double lowerBound = userCalories * 0.90; // 10% under userCalories
    final double upperBound = userCalories * 1.10; // 10% over userCalories

    return totalCalories >= lowerBound && totalCalories <= upperBound;
  }

  OrderState copyWith({
    Response? response,
    List<Order>? orderItems,
  }) {
    return OrderState(
      response: response ?? this.response,
      orderItems: orderItems ?? this.orderItems,
    );
  }

  @override
  List<Object?> get props => [
        response,
        orderItems,
      ];
}
