import 'package:flutter/material.dart';
import 'package:hypercare/features/authentication/controllers/onboarding_controller.dart';
import 'package:hypercare/utils/constraints/sizes.dart';
import 'package:hypercare/utils/device/device_utility.dart';


class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: TDeviceUtils.getAppBarHeight(),
        right: TSizes.defaultSpace,
        child: TextButton(
          onPressed: () =>OnBoardingController.instance.skipPage(),
          child: const Text('Skip'),
        ));
  }
}