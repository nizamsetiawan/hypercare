import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypercare/common/widgets/appbar/appbar.dart';
import 'package:hypercare/common/widgets/appbar/tabbar.dart';
import 'package:hypercare/common/widgets/brands/brand_card.dart';
import 'package:hypercare/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:hypercare/common/widgets/layouts/grid_layout.dart';
import 'package:hypercare/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:hypercare/common/widgets/texts/section_heading.dart';
import 'package:hypercare/features/shop/controllers/category_controller.dart';
import 'package:hypercare/features/shop/screens/brand/all_brands.dart';
import 'package:hypercare/features/shop/screens/store/widgets/category_tab.dart';
import 'package:hypercare/utils/constraints/colors.dart';
import 'package:hypercare/utils/constraints/sizes.dart';
import 'package:hypercare/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
          title:
              Text('Meditasi', style: Theme.of(context).textTheme.headlineMedium),
          actions: const [
            TCartCounterIcon(),
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    floating: true,
                    backgroundColor: THelperFunctions.isDarkMode(context)
                        ? TColors.black
                        : TColors.white,
                    expandedHeight: 440,
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.all(TSizes.defaultSpace),
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          const SizedBox(height: TSizes.spaceBtwItems),
                          const TSearchContainer(
                              text: 'Search in store',
                              showBorder: true,
                              showBackground: false,
                              padding: EdgeInsets.zero),
                          const SizedBox(height: TSizes.spaceBtwSections),

                          ///- featured brands
                          TSectionHeading(
                              title: 'Featured Brands', onPressed: () => Get.to(() => const AllBrandsScreen())),
                          const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                          TGridLayout(
                              itemCount: 4,
                              mainAxisExtent: 80,
                              itemBuilder: (_, index) {
                                return const TBrandCard(showBorder: false);
                              })
                        ],
                      ),
                    ),

                    ///tabs
                    bottom:  TTabBar(
                        tabs: categories.map((category) => Tab(child: Text(category.name))).toList()
                    ),
                ),
              ];
            },
            body: TabBarView(
                children: categories.map((category) => TCategoryTab(category: category)).toList()
            ),
        ),
      ),
    );
  }
}


