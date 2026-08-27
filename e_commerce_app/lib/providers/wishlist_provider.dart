import 'package:e_commerce_app/models/wishlist_model.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class WishlistProvider with ChangeNotifier {
  final Map<String, WishlistModel> _wishlistItems = {};
  Map<String, WishlistModel> get getWishlist {
    return _wishlistItems;
  }

  void addOrRemoveFromWishlist({required String productID}) {
    if (_wishlistItems.containsKey(productID)) {
      _wishlistItems.remove(productID);
    } else {
      _wishlistItems.putIfAbsent(
        productID,
        () => WishlistModel(wishlistID: Uuid().v4(), productID: productID),
      );
    }
    notifyListeners();
  }

  bool isProdInWishlist({required String productID}) {
    return _wishlistItems.containsKey(productID);
  }

  void clearLocalWishlist() {
    _wishlistItems.clear();
    notifyListeners();
  }
}
