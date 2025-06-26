import 'package:balanced_meal/data/constants/strings.dart';
import 'package:balanced_meal/data/models/item.dart';
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

  double get totalPriceOfAllOrders {
    if (orderItems.isEmpty) {
      return 0.0;
    }
    return orderItems.fold(0.0, (sum, item) {
      final price = item.totalPrice ?? 0.0;
      return sum + price;
    });
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
