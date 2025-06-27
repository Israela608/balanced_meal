import 'dart:convert';
import 'dart:developer';

import 'package:balanced_meal/core/utils/constants.dart';
import 'package:balanced_meal/data/constants/strings.dart';
import 'package:balanced_meal/data/firebase_ref/references.dart';
import 'package:balanced_meal/data/models/food_category.dart';
import 'package:balanced_meal/data/models/item.dart';
import 'package:balanced_meal/data/models/response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FoodNotifier extends StateNotifier<Response<List<FoodCategory>>> {
  FoodNotifier() : super(Response.initial());

  void initialize() => state = Response.initial();

  Future<void> getAllFoods() async {
    state = Response.loading(Strings.gettingFoods);

    try {
      //Get all the data or documents from the questionPapers collection
      QuerySnapshot<Map<String, dynamic>> data = await foodCategoryRF.get();

      List<FoodCategory> foodCategoryList = [];

      for (final categoryDoc in data.docs) {
        final categoryId = categoryDoc.id;
        final categoryTitle = categoryDoc.data()['title'];

        // Get items subcollection
        final itemsQuery =
            await categoryDoc.reference.collection(AppConst.foodItems).get();

        final items = itemsQuery.docs
            .map((itemDoc) => Item.fromSnapshot(itemDoc))
            .toList();

        foodCategoryList.add(FoodCategory(
          id: categoryId,
          title: categoryTitle,
          items: items,
        ));
      }

      state = Response.success(foodCategoryList);
    } catch (e) {
      state = Response.error(e.toString());
    }
  }

  Future<void> getAllFoodsFromLocalDB(BuildContext context) async {
    final manifestContent =
        await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    //Load json files path
    final foodsInAssets = manifestMap.keys
        .where((path) => path.startsWith('assets/DB') && path.contains('.json'))
        .toList();

    //We have to convert the json contents into a model.
    //Each json subject file becomes an object of Items
    List<FoodCategory> categories = [];

    //Read the contents from the path
    for (var foodCategory in foodsInAssets) {
      String stringFoodCategory = await rootBundle.loadString(foodCategory);
      log(stringFoodCategory);

      //String into a map
      categories.add(FoodCategory.fromJson(json.decode(stringFoodCategory)));
    }

    state = Response.success(categories);
  }
}
