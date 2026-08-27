import 'package:e_commerce_app/providers/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class HeartButtonWidget extends StatefulWidget {
  final Color bgColor;
  final double size;
  final String productID;
  final bool? isInWishlist;

  const HeartButtonWidget({
    super.key,
    this.bgColor = Colors.transparent,
    this.size = 20,
    required this.productID,
    this.isInWishlist = false,
  });

  @override
  State<HeartButtonWidget> createState() => _HeartButtonWidgetState();
}

class _HeartButtonWidgetState extends State<HeartButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);

    return Container(
      decoration: BoxDecoration(color: widget.bgColor, shape: BoxShape.circle),
      child: IconButton(
        style: IconButton.styleFrom(elevation: 10),
        icon: Icon(
          wishlistProvider.isProdInWishlist(productID: widget.productID)
              ? IconlyBold.heart
              : IconlyLight.heart,
          size: widget.size,
          color: wishlistProvider.isProdInWishlist(productID: widget.productID)
              ? Colors.red
              : Colors.grey,
        ),
        onPressed: () {
          wishlistProvider.addOrRemoveFromWishlist(productID: widget.productID);
        },
      ),
    );
  }
}
