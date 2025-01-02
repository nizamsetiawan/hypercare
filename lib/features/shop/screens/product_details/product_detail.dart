import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypercare/features/shop/controllers/images_controller.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:hypercare/common/widgets/texts/section_heading.dart';
import 'package:hypercare/features/shop/models/product_model.dart';
import 'package:hypercare/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:hypercare/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:hypercare/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:hypercare/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:hypercare/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:hypercare/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:hypercare/utils/constraints/enums.dart';
import 'package:hypercare/utils/constraints/sizes.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key, required this.product}) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///1- product image slider
             TProductImageSlider(product: product),
            
            ///2- product details
            Padding(
              padding: const EdgeInsets.only(right: TSizes.defaultSpace, left: TSizes.defaultSpace, bottom: TSizes.defaultSpace),
              child: Column(
                children: [

                  ///Price,title,stock & brand
                  TProductMetaData(product: product),

                  ///Attributes
                  if(product.productType == ProductType.variable.toString()) TProductAttributes(product: product),
                  if(product.productType == ProductType.variable.toString()) const SizedBox(height: TSizes.spaceBtwSections),

                  // /checkout button
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){
                     ImagesController.instance.showVideoPopup(product.videoUrl ?? '');
                  }, child: const Text('Tonton Video'))),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  ///description
                  const TSectionHeading(title: 'Deskripsi', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ReadMoreText(
                    product.description ?? 'Description is empty',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: '...Show more',
                    trimExpandedText: ' Less',
                    moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  ///description
                  const TSectionHeading(title: 'Tujuan', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ReadMoreText(
                    product.purpose ?? 'Purpose is empty',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: '...Show more',
                    trimExpandedText: ' Less',
                    moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                //   ///reviews
                //   const Divider(),
                //   const SizedBox(height: TSizes.spaceBtwItems),
                //   Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       const TSectionHeading(title: 'Reviews(199)', showActionButton: false),
                //       IconButton(onPressed: () => Get.to(() => const ProductReviewsScreen()), icon: const Icon(Iconsax.arrow_right_3, size: 18))
                //     ],
                //   ),
                //   const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),

            )
          ],


        ),
      ),
    );
  }
}




