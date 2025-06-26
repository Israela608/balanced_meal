import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final String? name;
  final double? totalPrice;
  final int? quantity;
  final int? calories;

  const Order({
    this.name,
    this.totalPrice,
    this.quantity,
    this.calories,
  });

  Order copyWith({
    String? name,
    double? totalPrice,
    int? quantity,
    int? calories,
  }) {
    return Order(
      name: name ?? this.name,
      totalPrice: totalPrice ?? this.totalPrice,
      quantity: quantity ?? this.quantity,
      calories: calories ?? this.calories,
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

  @override
  List<Object?> get props => [name, totalPrice, quantity];
}
