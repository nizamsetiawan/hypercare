import 'package:flutter/material.dart';
import 'package:hypercare/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:hypercare/common/widgets/images/t_circular_image.dart';
import 'package:hypercare/common/widgets/texts/product_price_text.dart';
import 'package:hypercare/common/widgets/texts/product_title_text.dart';
import 'package:hypercare/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:hypercare/features/shop/controllers/product_controller.dart';
import 'package:hypercare/features/shop/models/product_model.dart';
import 'package:hypercare/utils/constraints/colors.dart';
import 'package:hypercare/utils/constraints/enums.dart';
import 'package:hypercare/utils/constraints/image_strings.dart';
import 'package:hypercare/utils/constraints/sizes.dart';
import 'package:hypercare/utils/helpers/helper_functions.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({Key? key, required this.product}) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = product.price.toInt();
    final duration = product.stock.toString();

    final darkMode = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///price & sale price
        Row(
          children: [
            ///Sale Tag
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text('Hari ke- $salePercentage',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: TColors.black)),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            ///price
            // if(product.productType == ProductType.single.toString() && product.salePrice > 0)
            // Text('\$${product.price}', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            // if(product.productType == ProductType.single.toString() && product.salePrice > 0) const SizedBox(width: TSizes.spaceBtwItems),
            // TProductPriceText(price: controller.getProductPrice(product), isLarge: true),
          ],
        ),
        const SizedBox(width: TSizes.spaceBtwItems / 1.5),

        ///title
        TProductTitleText(title: product.title),
        const SizedBox(width: TSizes.spaceBtwItems / 1.5),

        ///stock status
        Row(
          children: [
            const TProductTitleText(title: 'Durasi :'),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text( '${product.stock} Menit' , style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(width: TSizes.spaceBtwItems / 1.5),
        ///brand
        Row(
          children: [
            TCircularImage(
                image: product.brand != null ? product.brand!.image : '',
              width: 42,
              height: 42,
            ),
            TBrandTitleWithVerifiedIcon(title: product.brand != null ? product.brand!.name : '', brandTextSize: TextSizes.medium),
          ],
        ),
      ],
    );
  }
}
