import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final int? id;
  final String? foodName;
  final int? calories;
  final String? imageUrl;
  final double? price;

  const Item({
    this.id,
    this.foodName,
    this.calories,
    this.imageUrl,
    this.price,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      foodName: json['food_name'],
      calories: json['calories'],
      imageUrl: json['image_url'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'food_name': foodName,
      'calories': calories,
      'image_url': imageUrl,
    };
  }

  static List<Item> fromListJson(List<dynamic>? jsonList) {
    if (jsonList == null) {
      return [];
    }
    return jsonList.map((json) => Item.fromJson(json)).toList();
  }

  @override
  List<Object?> get props => [
        id,
        foodName,
        calories,
        imageUrl,
        price,
      ];
}
