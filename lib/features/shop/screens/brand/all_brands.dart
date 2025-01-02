// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hypercare/common/widgets/appbar/appbar.dart';
// import 'package:hypercare/common/widgets/brands/brand_card.dart';
// import 'package:hypercare/common/widgets/layouts/grid_layout.dart';
// import 'package:hypercare/common/widgets/texts/section_heading.dart';
// import 'package:hypercare/features/shop/screens/brand/brand_products.dart';
// import 'package:hypercare/utils/constraints/sizes.dart';
//
// class AllBrandsScreen extends StatelessWidget {
//   const AllBrandsScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const TAppBar(title: Text('Pilihan Menu'), showBackArrow: true),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(TSizes.defaultSpace),
//           child: Column(
//             children: [
//               ///--heading
//               const TSectionHeading(title: 'Pilihan Menu', showActionButton: false),
//               const SizedBox(height: TSizes.spaceBtwItems),
//
//               ///--brands
//               TGridLayout(
//                   itemCount: 10,
//                   mainAxisExtent: 80,
//                   itemBuilder: (context, index) => TBrandCard(
//                         showBorder: true,
//                         onTap: () => Get.to(() => const BrandProducts()),
//                       )),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
