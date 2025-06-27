import 'package:balanced_meal/data/models/item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class FoodCategory extends Equatable {
  final String? id;
  final String? title;
  final List<Item>? items;

  const FoodCategory({
    this.id,
    this.title,
    this.items,
  });

  factory FoodCategory.fromJson(Map<String, dynamic> json) {
    return FoodCategory(
      id: json['id'],
      title: json['title'],
      items: (json['items'] as List)
          .map((dynamic e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  //If it's coming from firebase, use fromSnapshot()
  FoodCategory.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        title = snapshot.data()?['title'],
        items = [];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'items': items,
    };
  }

  static List<FoodCategory> fromListJson(List<dynamic>? jsonList) {
    if (jsonList == null) {
      return [];
    }
    return jsonList.map((json) => FoodCategory.fromJson(json)).toList();
  }

  @override
  List<Object?> get props => [
        id,
        title,
        items,
      ];
}
