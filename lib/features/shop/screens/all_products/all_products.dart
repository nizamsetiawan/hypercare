import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hypercare/common/widgets/appbar/appbar.dart';
import 'package:hypercare/common/widgets/loaders/vertical_product_shimmer.dart';
import 'package:hypercare/common/widgets/products/sortable/sortable_products.dart';
import 'package:hypercare/utils/constraints/sizes.dart';

import '../../controllers/all_product_controller.dart';
import '../../models/product_model.dart';

class AllProducts extends StatelessWidget {
  const AllProducts(
      {Key? key, required this.title, this.query, this.fetchProductsByQuery})
      : super(key: key);

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? fetchProductsByQuery;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());

    return Scaffold(
      appBar: TAppBar(title: Text(title), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder(
              future: fetchProductsByQuery ??
                  controller.fetchProductsByQuery(query),
              builder: (context, snapshot) {
                const loader = TVerticalProductShimmer();
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return loader;
                }
                if (!snapshot.hasData ||
                    snapshot.data == null ||
                    snapshot.data!.isEmpty) {
                  return const Center(child: Text('No Data Found'));
                }
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }
                final products = snapshot.data!;
                return TSortableProducts(
                  products: products,
                );
              }),
        ),
      ),
    );
  }
}
