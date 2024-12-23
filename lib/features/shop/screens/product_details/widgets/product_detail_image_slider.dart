import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:hypercare/common/widgets/appbar/appbar.dart';
import 'package:hypercare/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:hypercare/common/widgets/icons/t_circular_icon.dart';
import 'package:hypercare/common/widgets/images/t_rounded_image.dart';
import 'package:hypercare/features/shop/controllers/images_controller.dart';
import 'package:hypercare/features/shop/models/product_model.dart';
import 'package:hypercare/utils/constraints/colors.dart';
import 'package:hypercare/utils/constraints/sizes.dart';
import 'package:hypercare/utils/helpers/helper_functions.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);
    final dark = THelperFunctions.isDarkMode(context);
    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            ///main large image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(child: Obx(() {
                  final image = controller.selectedProductImage.value;
                  return GestureDetector(
                    onTap: () => controller.showEnlargedImage(image),
                    child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_, __, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress,
                                color: TColors.primary)),
                  );
                })),
              ),
            ),

            ///image slider
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: TSizes.spaceBtwItems),
                  itemBuilder: (_, index) => Obx(() {
                    final imageSelected =
                        controller.selectedProductImage.value == images[index];
                    return TRoundedImage(
                        width: 80,
                        isNetworkImage: true,
                        backgroundColor: dark ? TColors.dark : TColors.white,
                        onPressed: () => controller.selectedProductImage.value =
                            images[index],
                        border: Border.all(
                            color: imageSelected
                                ? TColors.primary
                                : Colors.transparent),
                        padding: const EdgeInsets.all(TSizes.sm),
                        imageUrl: images[index]);
                  }),
                ),
              ),
            ),

            ///appbar icons
            const TAppBar(
              showBackArrow: true,
              actions: [
                TCircularIcon(icon: Iconsax.heart5, color: Colors.red),
              ],
            )
          ],
        ),
      ),
    );
  }
}
