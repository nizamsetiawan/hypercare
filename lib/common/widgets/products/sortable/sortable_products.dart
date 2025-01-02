import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hypercare/features/shop/controllers/all_product_controller.dart';
import 'package:iconsax/iconsax.dart';
import 'package:hypercare/common/widgets/layouts/grid_layout.dart';
import 'package:hypercare/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:hypercare/features/shop/models/product_model.dart';
import 'package:hypercare/utils/constraints/sizes.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        ///dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          value: controller.selectedOptions.value,
          onChanged: (value) {
            controller.setSelectedOptions(value!);
          },
          items: [
            'Nama A-Z',
            'Hari Terakhir',
            'Hari Terawal',
          ]
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),

        ///products
        Obx(() => TGridLayout(
            itemCount: controller.products.length,
            itemBuilder: (_, index) =>
                TProductCardVertical(product: controller.products[index]))),
      ],
    );
  }
}
