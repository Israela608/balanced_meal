import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final String? name;
  final int? totalPrice;
  final int? quantity;

  const Item({
    this.name,
    this.totalPrice,
    this.quantity,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
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

  static List<Item> fromListJson(List<dynamic>? jsonList) {
    if (jsonList == null) {
      return [];
    }
    return jsonList.map((json) => Item.fromJson(json)).toList();
  }

  @override
  List<Object?> get props => [name, totalPrice, quantity];
}
