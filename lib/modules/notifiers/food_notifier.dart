import 'dart:convert';
import 'dart:developer';

import 'package:balanced_meal/data/constants/strings.dart';
import 'package:balanced_meal/data/firebase_ref/references.dart';
import 'package:balanced_meal/data/models/food_category.dart';
import 'package:balanced_meal/data/models/response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FoodNotifier extends StateNotifier<Response<List<FoodCategory>>> {
  FoodNotifier() : super(Response.initial());

  void initialize() => state = Response.initial();

  Future<void> getData(BuildContext context) async {
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

  Future<void> getAllFoods() async {
    state = Response.loading(Strings.gettingFoods);

    try {
      //Get all the data or documents from the questionPapers collection
      QuerySnapshot<Map<String, dynamic>> data = await foodCategoryRF.get();

      //We convert the snapshot map to a list of FoodCategory by looping through it
      final foodCategoryList = data.docs
          .map((category) => FoodCategory.fromSnapshot(category))
          .toList();

      state = Response.success(foodCategoryList);
    } catch (e) {
      state = Response.error(e.toString());
    }
  }
}
