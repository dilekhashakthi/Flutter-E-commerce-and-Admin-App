import 'package:flutter/material.dart';

class WishlistModel with ChangeNotifier {
  final String wishlistID;
  final String productID;

  WishlistModel({required this.wishlistID, required this.productID});
}
