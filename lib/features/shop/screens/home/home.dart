import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypercare/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:hypercare/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:hypercare/common/widgets/layouts/grid_layout.dart';
import 'package:hypercare/common/widgets/loaders/vertical_product_shimmer.dart';
import 'package:hypercare/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:hypercare/common/widgets/texts/section_heading.dart';
import 'package:hypercare/features/shop/controllers/product_controller.dart';
import 'package:hypercare/features/shop/screens/all_products/all_products.dart';
import 'package:hypercare/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:hypercare/features/shop/screens/home/widgets/home_categories.dart';
import 'package:hypercare/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:hypercare/utils/constraints/sizes.dart';

import '../../../../utils/constraints/text_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///header
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  ///appbar
                  THomeAppBar(),
                  ///searchbar
                  // TSearchContainer(text: 'Temukan ketenangan Anda...'),


                  ///categories
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        ///heading of categories
                        // TSectionHeading(
                        //     title: 'Kategori Mindfulness',
                        //     showActionButton: false,
                        //     textColor: Colors.white),
                        // SizedBox(height: TSizes.spaceBtwItems),

                        ///categories
                        // THomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            ///Body
            Padding(
              padding: const EdgeInsets.only(left: TSizes.defaultSpace, right: TSizes.defaultSpace, bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  ///-heading
                  TSectionHeading(
                    title: 'Layanan Terbaik',
                    onPressed: () => Get.to(() => AllProducts(
                          title: 'Semua Layanan',
                      // query: FirebaseFirestore.instance.collection('Product').where('IsFeatured', isEqualTo: true),
                      fetchProductsByQuery: controller.fetchAllFeaturedProducts(),
                        )),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  ///popular products
                  Obx(() {
                    if (controller.isLoading.value)
                      return const TVerticalProductShimmer();
                    if (controller.featuredProducts.isEmpty) {
                      return Center(
                          child: Text('No data found!',
                              style: Theme.of(context).textTheme.bodyMedium));
                    }
                    return TGridLayout(
                        itemCount: controller.featuredProducts.length,
                        itemBuilder: (_, index) => TProductCardVertical(
                            product: controller.featuredProducts[index]));
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
