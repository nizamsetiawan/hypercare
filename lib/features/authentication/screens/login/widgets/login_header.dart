import 'package:flutter/material.dart';
import 'package:hypercare/utils/constraints/image_strings.dart';
import 'package:hypercare/utils/constraints/sizes.dart';
import 'package:hypercare/utils/constraints/text_strings.dart';
import 'package:hypercare/utils/helpers/helper_functions.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 100,
          image: AssetImage(dark ? TImages.appLogoLight : TImages.appLogoDark),),
        const SizedBox(height: TSizes.sm),
        Text(TTexts.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: TSizes.sm),
        Text(TTexts.loginSubTitle,
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}