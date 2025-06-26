import 'dart:convert';
import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'package:balanced_meal/data/constants/strings.dart';
import 'package:balanced_meal/data/firebase_ref/references.dart';
import 'package:balanced_meal/data/models/food_category.dart';
import 'package:balanced_meal/data/models/response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FoodNotifier extends StateNotifier<Response<List<FoodCategory>>> {
  FoodNotifier() : super(Response.initial()) {
    //uploadData();
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
