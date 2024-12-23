import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypercare/common/widgets/appbar/appbar.dart';
import 'package:hypercare/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:hypercare/features/shop/screens/checkout/checkout.dart';
import 'package:hypercare/utils/constraints/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),

        ///items in cart
        child: TCartItems()
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: () => Get.to(() => const CheckoutScreen()), child: const Text('Checkout \$256')),
      ),
    );
  }
}


