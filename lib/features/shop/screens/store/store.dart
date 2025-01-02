import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypercare/common/widgets/appbar/appbar.dart';
import 'package:hypercare/common/widgets/brands/brand_card.dart';
import 'package:hypercare/common/widgets/layouts/grid_layout_choice.dart';
import 'package:hypercare/utils/constraints/colors.dart';
import 'package:hypercare/utils/constraints/sizes.dart';
import 'package:hypercare/features/shop/controllers/brand_controller.dart';  // Pastikan BrandController diimpor

import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constraints/sizes.dart';
import '../brand/brand_products.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BrandController brandController =  Get.put(BrandController());



    return Scaffold(
      appBar: const TAppBar(
        title: Text('Pendidikan tentang Mindfulness'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Obx(() {
          if (brandController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                /// Featured Brands section
                const TSectionHeading(title: 'Pilihan Menu', showActionButton: false),
                const SizedBox(height: TSizes.spaceBtwItems),

                // Navigasi ke BrandProducts
                TGridLayoutChoice(
                  itemCount: brandController.featuredBrands.length,
                  mainAxisExtent: 80,
                  itemBuilder: (context, index) {
                    final brand = brandController.featuredBrands[index];
                    return TBrandCard(
                      showBorder: true,
                      onTap: () => Get.to(() => BrandProducts(brand: brand)),
                      brandName: brand.name,
                      productCount: brand.productsCount ?? 0,
                      imagePath: brand.image,
                    );
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
