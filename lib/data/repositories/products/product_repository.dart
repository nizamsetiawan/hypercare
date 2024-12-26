import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hypercare/features/shop/models/product_model.dart';
import 'package:hypercare/utils/exceptions/firebase_exceptions.dart';
import 'package:hypercare/utils/exceptions/platform_exceptions.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  ///firestore instance for db interactions
  final _db = FirebaseFirestore.instance;

  ///get limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db.collection('Product').where('IsFeatured', isEqualTo: true).limit(1).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch(e) {
      throw TPlatformException(e.code).message;
    } catch(e) {
      throw 'Something went wrong! Please try again';
    }
  }

  ///upload dummy data to firebase
  Future<void> uploadDummyData(List<ProductModel> products) async {

  }
}