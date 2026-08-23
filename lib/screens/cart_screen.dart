import 'package:e_commerce_app/services/assets_manager.dart';
import 'package:e_commerce_app/widgests/empty_bag.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: EmptyBagWidget(
      imagePath: AssetsManager.shoppingBasket,
      title: "Whoopds!",
      subtitle: "Your cart is empty",
      buttonText: "Looks like your cart is empty. Add something and make me happy!",
    ));
  }
}
