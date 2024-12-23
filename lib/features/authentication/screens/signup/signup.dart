import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypercare/common/widgets/login_signup/form_divider.dart';
import 'package:hypercare/common/widgets/login_signup/social_buttons.dart';
import 'package:hypercare/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:hypercare/utils/constraints/sizes.dart';
import 'package:hypercare/utils/constraints/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Title
              Text(TTexts.signUpTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtwSections),

              ///form
              const TSignupForm(),
              const SizedBox(height: TSizes.spaceBtwSections),

              ///divider
              TFormDivider(dividerText: TTexts.orSignUpWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections),

              ///social buttons
              const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
