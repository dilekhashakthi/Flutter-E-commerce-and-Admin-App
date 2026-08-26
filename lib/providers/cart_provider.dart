import 'package:e_commerce_app/models/cart_model.dart';
import 'package:e_commerce_app/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartModel> _cartItems = {};
  Map<String, CartModel> get getCartItems {
    return _cartItems;
  }

  void addProductToCart({required String productID}) {
    _cartItems.putIfAbsent(
      productID,
      () => CartModel(
        cartID: const Uuid().v4(),
        productID: productID,
        quantity: 1,
      ),
    );
    notifyListeners();
  }

  bool isProdInCart({required String productID}) {
    return _cartItems.containsKey(productID);
  }

  double getTotal({required ProductProvider productsProvider}) {
    double total = 0.0;

    _cartItems.forEach((key, value) {
      final getCurrProduct = productsProvider.findByProdId(value.productID);
      if (getCurrProduct == null) {
        total += 0;
      } else {
        total += double.parse(getCurrProduct.productPrice) * value.quantity;
      }
    });

    return total;
  }

  int getQty() {
    int total = 0;

    _cartItems.forEach((key, value) {
      total += value.quantity;
    });

    return total;
  }
}
