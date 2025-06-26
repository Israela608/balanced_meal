import 'package:balanced_meal/core/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final fireStore = FirebaseFirestore.instance;

//If this variable is invoked, 'foodItems' collection will be created in our firestore backend
final foodCategoryRF = fireStore.collection(AppConst.foodCategory);

DocumentReference foodItemRF({
  required String foodCategoryId,
  required String foodId,
})
//Locate the document with name the same as this foodType,
//Create a collection under this document with the name 'items'
//Create a document under this collection with name the same as the foodId
    =>
    foodCategoryRF
        .doc(foodCategoryId)
        .collection(AppConst.foodItems)
        .doc(foodId);
