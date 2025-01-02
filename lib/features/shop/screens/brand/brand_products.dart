import 'package:flutter/material.dart';
import 'package:hypercare/common/widgets/appbar/appbar.dart';
import 'package:hypercare/common/widgets/brands/brand_card.dart';
import 'package:hypercare/common/widgets/products/sortable/sortable_products.dart';
import 'package:hypercare/utils/constraints/sizes.dart';
import 'package:hypercare/features/shop/models/brand_model.dart';

class BrandProducts extends StatelessWidget {
  final BrandModel brand;

  // Constructor menerima brand sebagai parameter
  const BrandProducts({Key? key, required this.brand}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Detail Pilihan ${brand.name}'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Brand detail
              TBrandCard(
                showBorder: true,
                brandName: brand.name,
                productCount: brand.productsCount ?? 0,
                imagePath: brand.image,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Brand products
              TSortableProducts(products: []),  // We can pass products related to the brand here
            ],
          ),
        ),
      ),
    );
  }
}
