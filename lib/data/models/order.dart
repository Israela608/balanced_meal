import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final String? name;
  final double? totalPrice;
  final int? quantity;

  const Order({
    this.name,
    this.totalPrice,
    this.quantity,
  });

  Order copyWith({
    String? name,
    double? totalPrice,
    int? quantity,
  }) {
    return Order(
      name: name ?? this.name,
      totalPrice: totalPrice ?? this.totalPrice,
      quantity: quantity ?? this.quantity,
    );
  }

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      name: json['name'],
      totalPrice: json['total_price'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'total_price': totalPrice,
      'quantity': quantity,
    };
  }

  static List<Order> fromListJson(List<dynamic>? jsonList) {
    if (jsonList == null) {
      return [];
    }
    return jsonList.map((json) => Order.fromJson(json)).toList();
  }

  @override
  List<Object?> get props => [name, totalPrice, quantity];
}
