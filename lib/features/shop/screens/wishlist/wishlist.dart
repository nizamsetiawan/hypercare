import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:hypercare/common/widgets/appbar/appbar.dart';
import 'package:hypercare/common/widgets/icons/t_circular_icon.dart';
import 'package:hypercare/common/widgets/layouts/grid_layout.dart';
import 'package:hypercare/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:hypercare/features/shop/models/product_model.dart';
import 'package:hypercare/features/shop/screens/home/home.dart';
import 'package:hypercare/utils/constraints/sizes.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title:
            Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),

          ///products grid
          child: TGridLayout(
              itemCount: 6,
              itemBuilder: (_, index) => TProductCardVertical(product: ProductModel.empty())),
        ),
      ),
    );
  }
}
