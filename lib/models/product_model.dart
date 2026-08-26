import 'package:flutter/material.dart';

class ProductModel with ChangeNotifier {
  final String productID,
      productTitle,
      productPrice,
      productCategory,
      productDescription,
      productImage,
      productQuantity;

  new({
    required this.productID,
    required this.productTitle,
    required this.productPrice,
    required this.productCategory,
    required this.productDescription,
    required this.productImage,
    required this.productQuantity,
  });
}
