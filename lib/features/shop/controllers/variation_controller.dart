import 'package:get/get.dart';
import 'package:hypercare/data/repositories/categories/category_repository.dart';
import 'package:hypercare/features/shop/models/category_model.dart';
import 'package:hypercare/features/shop/models/product_variation_model.dart';
import 'package:hypercare/utils/helpers/loaders.dart';

import '../models/product_model.dart';
import 'images_controller.dart';

class Variationcontroller extends GetxController {
  static Variationcontroller get instance => Get.find();

  ///Variables
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;

  ///select attribute and variant
  void onAttributeSelected(
      ProductModel product, attributeName, attributeValue) {
    final selectedAttributes =
        Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;

    final selectedVariation = product.productVariations!.firstWhere(
      (variation) => _isSameAttributesValues(
          variation.attributeValues, selectedAttributes),
      orElse: () => ProductVariationModel.empty(),
    );

    //show the images as a mainPage
    if (selectedVariation.image.isNotEmpty) {
      ImagesController.instance.selectedProductImage.value =
          selectedVariation.image;
    }

    //Assign selected variation
    this.selectedVariation.value = selectedVariation;
  }

  ///check if selected attributes matches any variation attributes
  bool _isSameAttributesValues(Map<String, dynamic> variationAttributes,
      Map<String, dynamic> selectedAttributes) {
    if (variationAttributes.length != selectedAttributes.length) {
      return false;
    }

    for (final key in variationAttributes.keys) {
      if (variationAttributes[key] != selectedAttributes[key]) {
        return false;
      }
    }
    return true;
  }

  void getProductVariationStockStatus() {
    variationStockStatus.value =
        selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  //check attribute availability / stock in variation
  Set<String?> getAttributesAvailabilityInVariation(
      List<ProductVariationModel> variations, String attributeName) {
    final availableVariationAttributesValues = variations
        .where((variation) =>
            variation.attributeValues[attributeName] != null &&
            variation.attributeValues[attributeName]!.isNotEmpty &&
            variation.stock > 0)
        .map((variation) => variation.attributeValues[attributeName])
        .toSet();
    return availableVariationAttributesValues;
  }

  String getVariationPrice() {
    return(selectedVariation.value.salePrice > 0 ? selectedVariation.value.salePrice : selectedVariation.value.price).toString();
  }

  //reset selected attributes when switching to another product
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = "";
    selectedVariation.value = ProductVariationModel.empty();
  }
}
