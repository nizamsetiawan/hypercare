import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:hypercare/features/personalization/screens/settings/settings.dart';
import 'package:hypercare/features/shop/screens/home/home.dart';
import 'package:hypercare/features/shop/screens/store/store.dart';
import 'package:hypercare/features/shop/screens/wishlist/wishlist.dart';
import 'package:hypercare/utils/constraints/colors.dart';
import 'package:hypercare/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);


    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: darkMode ? TColors.black : Colors.white,
          indicatorColor: darkMode ? TColors.white.withOpacity(0.1) : TColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: "Beranda"),
            NavigationDestination(icon: Icon(Iconsax.heart), label: "Meditasi"),
            NavigationDestination(icon: Icon(Iconsax.clipboard), label: "Program"),
            NavigationDestination(icon: Icon(Iconsax.user), label: "Profil"),

          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}


class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    const FavouriteScreen(),
    const SettingsScreen(),
  ];
}
