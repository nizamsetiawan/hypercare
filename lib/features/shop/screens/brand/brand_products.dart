import 'package:flutter/material.dart';
import 'package:hypercare/common/widgets/appbar/appbar.dart';
import 'package:hypercare/common/widgets/brands/brand_card.dart';
import 'package:hypercare/common/widgets/products/sortable/sortable_products.dart';
import 'package:hypercare/utils/constraints/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(title: Text('Nike')),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///brand detail
              TBrandCard(showBorder: true),
              SizedBox(height: TSizes.spaceBtwSections),

              TSortableProducts()
            ],
          ),
        ),
      ),
    );
  }
}
