import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final String? foodName;
  final int? calories;
  final String? imageUrl;

  const Item({
    this.foodName,
    this.calories,
    this.imageUrl,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      foodName: json['food_name'],
      calories: json['calories'],
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
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
  List<Object?> get props => [foodName, calories, imageUrl];
}
