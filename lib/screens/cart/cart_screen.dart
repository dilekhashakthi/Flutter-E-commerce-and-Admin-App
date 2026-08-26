import 'package:e_commerce_app/providers/cart_provider.dart';
import 'package:e_commerce_app/providers/product_provider.dart';
import 'package:e_commerce_app/screens/cart/bottom_checkout.dart';
import 'package:e_commerce_app/screens/cart/cart_widget.dart';
import 'package:e_commerce_app/services/assets_manager.dart';
import 'package:e_commerce_app/widgests/empty_bag.dart';
import 'package:e_commerce_app/widgests/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  final bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    // final productsProvider = Provider.of<ProductProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);

    return cartProvider.getCartItems.isEmpty
        ? Scaffold(
            body: EmptyBagWidget(
              imagePath: AssetsManager.shoppingBasket,
              title: "Whoopds!",
              subtitle: "Your cart is empty",
              buttonText: "Looks like your cart is empty. Add something and make me happy!",
            ),
          )
        : Scaffold(
            bottomSheet: CartBottomSheetWidget(),
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(AssetsManager.shoppingCart),
              ),
              title: TitleTextWidget(
                label: "Cart (${cartProvider.getCartItems.length})",
                fontSize: 20,
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    // Handle delete action
                  },
                  icon: Icon(IconlyLight.delete, color: Colors.red),
                ),
              ],
            ),
            body: ListView.builder(
              itemCount: cartProvider.getCartItems.length,
              itemBuilder: (context, index) {
                return const CartWidget();
              },
            ),
          );
  }
}
