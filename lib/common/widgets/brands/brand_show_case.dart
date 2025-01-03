import 'package:flutter/material.dart';
import 'package:hypercare/common/widgets/brands/brand_card.dart';
import 'package:hypercare/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:hypercare/utils/constraints/colors.dart';
import 'package:hypercare/utils/constraints/sizes.dart';
import 'package:hypercare/utils/helpers/helper_functions.dart';

class TBrandShowcase extends StatelessWidget {
  final List<String> images;
  final String brandName;
  final String brandImage;
  final int productCount;

  const TBrandShowcase({
    super.key,
    required this.images,
    required this.brandName,
    required this.brandImage,
    required this.productCount,
  });

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(TSizes.md),
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        children: [
          /// Brand with product count
          TBrandCard(
            showBorder: false,
            brandName: brandName,
            productCount: productCount,
            imagePath: brandImage,
          ),
          const SizedBox(height: TSizes.spaceBtwItems),

          /// Brand top three product images
          Row(
            children: images
                .map((image) => brandTopProductImageWidget(image, context))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: TRoundedContainer(
        height: 100,
        backgroundColor: THelperFunctions.isDarkMode(context)
            ? TColors.darkerGrey
            : TColors.light,
        margin: const EdgeInsets.only(right: TSizes.sm),
        padding: const EdgeInsets.all(TSizes.md),
        child: Image(
          fit: BoxFit.contain,
          image: AssetImage(image),
        ),
      ),
    );
  }
}
