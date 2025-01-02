import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;

  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured,
    this.productsCount
});

  //empty helper function
  static BrandModel empty() => BrandModel(id: '', name: '', image: '' , isFeatured: false, productsCount: 0);

  ///convert model to json architecture so you can store data in firestore
  toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'ProductCount': productsCount,
      'IsFeatured': isFeatured,
    };
  }

  ///Map json oriented document snapshot from firebase to usermodel
  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if(data.isEmpty) return BrandModel.empty();
    return BrandModel(
        id: data['Id'] ?? '',
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
        productsCount: data['ProductCount'] ?? 0
    );
  }

  factory BrandModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
   if (snapshot.data() != null) {
     final data = snapshot.data()!;
     return BrandModel(
         id: snapshot.id,
         name: data['Name'] ?? '',
         image: data['Image'] ?? '',
         isFeatured: data['IsFeatured'] ?? false,
         productsCount: data['ProductCount'] ??0
     );
   } else {
     return BrandModel.empty();
   }
  }
}