import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:hypercare/common/widgets/appbar/appbar.dart';
import 'package:hypercare/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:hypercare/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:hypercare/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:hypercare/common/widgets/texts/section_heading.dart';
import 'package:hypercare/data/repositories/authentication/authentication_repository.dart';
import 'package:hypercare/features/personalization/screens/address/address.dart';
import 'package:hypercare/features/personalization/screens/profile/profile.dart';
import 'package:hypercare/features/shop/screens/order/order.dart';
import 'package:hypercare/utils/constraints/colors.dart';
import 'package:hypercare/utils/constraints/sizes.dart';

import '../../../../data/repositories/products/product_repository.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productRepository = ProductRepository.instance; // Mendapatkan instance repository

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  ///appbar
                  TAppBar(
                      title: Text('Akun Saya',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .apply(color: TColors.white))),

                  ///user profile card
                  TUserProfileTile(
                      onPressed: () => Get.to(() => const ProfileScreen())),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            ///Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  ///-- Account settings
                  const TSectionHeading(
                      title: 'Pengaturan Akun', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  TSettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Address',
                    subTitle: 'Set shopping delivery address',
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),
                  const TSettingsMenuTile(
                      icon: Iconsax.language_square,
                      title: 'Ganti Bahasa',
                      subTitle: 'Pilih bahasa yang Anda inginkan untuk aplikasi'),
                   TSettingsMenuTile(
                      icon: Iconsax.data,
                      title: 'Unduhan',
                      subTitle: 'Lihat dan kelola file yang telah diunduh',
                       onTap: () => Get.to(() => const OrderScreen()),
                  ),
                  const TSettingsMenuTile(
                      icon: Iconsax.support,
                      title: 'Bantuan & Dukungan',
                      subTitle: 'Temukan jawaban atas pertanyaan Anda atau hubungi dukungan kami'),
                  const TSettingsMenuTile(
                      icon: Iconsax.money,
                      title: 'Langganan Premium',
                      subTitle: 'Nikmati fitur eksklusif dan lebih banyak manfaat'),
                  TSettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'Kualitas Gambar',
                    subTitle: 'Gunakan kualitas gambar tinggi',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.sun,
                    title: 'Mode',
                    subTitle: 'Gunakan mode gelap',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),

                  ///-- App settings
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const TSectionHeading(
                      title: 'Tentang Aplikasi', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const TSettingsMenuTile(
                      icon: Iconsax.information,
                      title: 'Tentang',
                      subTitle: 'Informasi tentang aplikasi dan tim pengembang'),
                  TSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Berikan Penilaian',
                    onTap: (){},
                    subTitle: 'Bantu kami dengan memberikan ulasan di Play Store',
                  ),
                  const TSettingsMenuTile(
                      icon: Iconsax.security_card,
                      title: 'Privasi dan Keamanan',
                      subTitle: 'Kelola privasi dan keamanan akun Anda'),


                  ///--logout button
                  const  SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () => AuthenticationRepository.instance.logout(),
                        child: const Text('Logout')),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections * 2.5),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
