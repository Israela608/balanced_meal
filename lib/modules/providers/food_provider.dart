import 'package:balanced_meal/data/models/food_category.dart';
import 'package:balanced_meal/data/models/response.dart';
import 'package:balanced_meal/modules/notifiers/food_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final foodProvider =
    StateNotifierProvider<FoodNotifier, Response<List<FoodCategory>>>((ref) {
  return FoodNotifier();
});
