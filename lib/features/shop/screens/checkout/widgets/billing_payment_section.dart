import 'package:flutter/material.dart';
import 'package:hypercare/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:hypercare/common/widgets/texts/section_heading.dart';
import 'package:hypercare/utils/constraints/colors.dart';
import 'package:hypercare/utils/constraints/image_strings.dart';
import 'package:hypercare/utils/constraints/sizes.dart';
import 'package:hypercare/utils/helpers/helper_functions.dart';

class  TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TSectionHeading(title: 'Payment Methods', buttonTitle: 'Change', onPressed: (){}),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          children: [
            TRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? TColors.light : TColors.white,
              padding: const EdgeInsets.all(TSizes.sm),
              child: const Image(image: AssetImage(TImages.paypal), fit: BoxFit.contain),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Text(' Paypal', style: Theme.of(context).textTheme.bodyLarge),
          ],
        )
      ],
    );
  }
}
