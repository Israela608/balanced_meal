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

class FoodUploadNotifier extends StateNotifier<Response<dynamic>> {
  FoodUploadNotifier() : super(Response.initial());

  Future<void> uploadData(BuildContext context) async {
    state = Response.loading(Strings.uploading);

    //Get a firebase firestore instance
    final fireStore = FirebaseFirestore.instance;

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

    /*
    Uploading all the data to firestore in a batch
    */
    // Number of documents to write per batch
    const batchSize = 200;
    // This is the batch
    var batch = fireStore.batch();
    // This is the counter that checks the number of batches currently uploaded
    var counter = 0;

    //This is the parent loop, that adds all the categories to the 'foodCategory' collection in firebase
    for (var category in categories) {
      //The id of the paper is the document name in the collection
      batch.set(foodCategoryRF.doc(category.id), {
        //These are the fields under the documents
        'title': category.title,
      });

      //This loop adds all the items to the 'items' sub-collection under the parent collection
      for (var items in category.items!) {
        final itemsPath = foodItemRF(
          foodCategoryId: category.id ?? '',
          foodId: items.id ?? '',
        );

        batch.set(itemsPath, {
          'food_name': items.foodName,
          'calories': items.calories,
          'image_url': items.imageUrl,
          'price': items.price,
        });

        // If the batch has reached the maximum size, submit it to Firestore
        if (++counter == batchSize) {
          await batch.commit();

          // Start a new batch
          batch = fireStore.batch();
          counter = 0;
        }
      }
    }

    // Submit the last batch, if it's not empty
    if (counter > 0) {
      await batch.commit();
    }

    state = state = Response.success(Strings.uploaded);
  }
}
