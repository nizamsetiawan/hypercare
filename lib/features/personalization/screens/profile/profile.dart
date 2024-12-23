import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:hypercare/common/widgets/appbar/appbar.dart';
import 'package:hypercare/common/widgets/images/t_circular_image.dart';
import 'package:hypercare/common/widgets/loaders/shimmer.dart';
import 'package:hypercare/common/widgets/texts/section_heading.dart';
import 'package:hypercare/features/personalization/controllers/user_controller.dart';
import 'package:hypercare/features/personalization/screens/profile/Widgets/change_name.dart';
import 'package:hypercare/features/personalization/screens/profile/Widgets/profile_menu.dart';
import 'package:hypercare/utils/constraints/image_strings.dart';
import 'package:hypercare/utils/constraints/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Profil'),
      ),

      ///--body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///profile picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image =
                          networkImage.isNotEmpty ? networkImage : TImages.user;
                      return controller.imageUploading.value
                          ? const TShimmerEffect(
                              width: 80, height: 80, radius: 80)
                          : TCircularImage(
                              image: image,
                              width: 80,
                              height: 80,
                              isNetworkImage: networkImage.isNotEmpty);
                    }),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: const Text('Ganti Foto Profil'))
                  ],
                ),
              ),

              ///details
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              ///heading profile info
              const TSectionHeading(
                  title: 'Informasi Profil', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(
                  title: 'Nama',
                  value: controller.user.value.fullName,
                  onPressed: () => Get.to(() => const ChangeName())),
              TProfileMenu(
                  title: 'Username',
                  value: controller.user.value.username,
                  onPressed: () {}),

              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              ///Heading personal info
              const TSectionHeading(
                  title: 'Informasi Pribadi', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(
                  title: 'User ID',
                  value: controller.user.value.id,
                  icon: Iconsax.copy,
                  onPressed: () {}),
              TProfileMenu(
                  title: 'E-mail',
                  value: controller.user.value.email,
                  onPressed: () {}),
              TProfileMenu(
                  title: 'Telepon',
                  value: controller.user.value.phoneNumber,
                  onPressed: () {}),
              TProfileMenu(title: 'Kelamin', value: 'Perempuan', onPressed: () {}),
              TProfileMenu(
                  title: 'Umur',
                  value: controller.user.value.age,
                  onPressed: () {}),
              TProfileMenu(
                  title: 'Pendidikan',
                  value: controller.user.value.major,
                  onPressed: () {}),
              TProfileMenu(
                  title: 'Pekerjaan',
                  value: controller.user.value.jobTitle,
                  onPressed: () {}),
              TProfileMenu(
                  title: 'Hipertensi',
                  value: controller.user.value.durationOfHypertension,
                  onPressed: () {}),

              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text('Close Account',
                      style: TextStyle(color: Colors.red)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
