import 'package:flutter/material.dart';
import 'package:hypercare/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:hypercare/common/widgets/images/t_circular_image.dart';
import 'package:hypercare/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:hypercare/utils/constraints/colors.dart';
import 'package:hypercare/utils/constraints/enums.dart';
import 'package:hypercare/utils/constraints/image_strings.dart';
import 'package:hypercare/utils/constraints/sizes.dart';
import 'package:hypercare/utils/helpers/helper_functions.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
    required this.brandName,
    required this.productCount,
    required this.imagePath,
  });

  final bool showBorder;
  final void Function()? onTap;
  final String brandName;
  final int productCount;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: TCircularImage(
                isNetworkImage: true,
                image: imagePath,
                backgroundColor: Colors.transparent,
                // overlayColor: isDark ? TColors.white : TColors.black,
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TBrandTitleWithVerifiedIcon(
                    title: brandName,
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    '$productCount products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
