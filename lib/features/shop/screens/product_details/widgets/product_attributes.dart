import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hypercare/common/widgets/chips/choice_chip.dart';
import 'package:hypercare/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:hypercare/common/widgets/texts/product_price_text.dart';
import 'package:hypercare/common/widgets/texts/product_title_text.dart';
import 'package:hypercare/common/widgets/texts/section_heading.dart';
import 'package:hypercare/features/shop/models/product_model.dart';
import 'package:hypercare/utils/constraints/colors.dart';
import 'package:hypercare/utils/constraints/sizes.dart';
import 'package:hypercare/utils/helpers/helper_functions.dart';

import '../../../controllers/variation_controller.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({Key? key, required this.product}) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Variationcontroller());
    final dark = THelperFunctions.isDarkMode(context);
    return Obx(
      () => Column(
        children: [
          ///selected attribute pricing & description
          if (controller.selectedVariation.value.id.isNotEmpty)
            TRoundedContainer(
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
              child: Column(
                children: [
                  ///title,price and stock status
                  Column(
                    children: [
                      // const TSectionHeading(
                      //     title: 'Teknik', showActionButton: false),
                      const SizedBox(width: TSizes.spaceBtwItems),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Row(
                          //   children: [
                          //     const TProductTitleText(
                          //         title:
                          //             'Price : ',
                          //         smallSize: true),
                          //     const SizedBox(width: TSizes.spaceBtwItems),
                          //
                          //     ///actual price
                          //     if (controller.selectedVariation.value.salePrice >
                          //         0)
                          //       Text(
                          //         '\$${controller.selectedVariation.value.price}',
                          //         style: Theme.of(context)
                          //             .textTheme
                          //             .titleSmall!
                          //             .apply(
                          //                 decoration:
                          //                     TextDecoration.lineThrough),
                          //       ),
                          //     const SizedBox(width: TSizes.spaceBtwItems),
                          //
                          //     ///sale price
                          //     TProductPriceText(
                          //         price: controller.getVariationPrice()),
                          //   ],
                          // ),

                          ///stack
                          Row(
                            children: [
                              TProductTitleText(
                                title:
                                'Durasi : ${controller.selectedVariation.value.stock.toString()} Menit',
                                smallSize: true,
                                maxLines: 50,
                              ),
                            ],
                          ),
                          TProductTitleText(
                            title:
                            'Materi : ${controller.selectedVariation.value.description}',
                            smallSize: true,
                            maxLines: 50,
                          ),
                        ],
                      ),
                    ],
                  ),

                  ///variable description

                ],
              ),
            ),
          const SizedBox(height: TSizes.spaceBtwItems),

          ///attributes
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!
                .map(
                  (attribute) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TSectionHeading(
                          title: attribute.name ?? '', showActionButton: false),
                      const SizedBox(height: TSizes.spaceBtwItems / 2),
                      Obx(
                        () => Wrap(
                          spacing: 8,
                          children: attribute.values!.map((attributeValue) {
                            final isSelected =
                                controller.selectedAttributes[attribute.name] ==
                                    attributeValue;
                            final available = controller
                            .getAttributesAvailabilityInVariation(
                              product.productVariations!, attribute.name!
                            )
                            .contains(attributeValue);

                            return TChoiceChip(
                                text: attributeValue,
                                selected: isSelected,
                                onSelected: available ? (selected) {
                                  if (selected && available){
                                    controller.onAttributeSelected(product, attribute.name ?? '', attributeValue);
                                  }
                                } : null,
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
