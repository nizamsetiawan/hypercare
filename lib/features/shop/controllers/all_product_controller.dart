import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hypercare/data/repositories/products/product_repository.dart';
import 'package:hypercare/utils/helpers/loaders.dart';

import '../models/product_model.dart';

class AllProductsController extends GetxController {
  static AllProductsController get instance => Get.find();

  final repository= ProductRepository.instance;
  final RxString selectedOptions = 'Nama A-Z'.obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;

  Future<List<ProductModel>> fetchProductsByQuery(Query? query) async {
    try {
      if (query == null) return [];
      final products = await repository.fetchProductsByQuery(query);
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh snap", message: e.toString());
      return [];
    }
  }

  void setSelectedOptions(String value) {
    selectedOptions.value = value;

    switch (value) {
      case 'Nama A-Z':
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Hari Terakhir':
        products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'Hari Terawal':
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
        default:
        products.sort((a, b) => a.title.compareTo(b.title));
    }
  }

  void assignProducts(List<ProductModel> products) {
    this.products.assignAll(products);
    setSelectedOptions('Nama A-Z');
  }

}