import 'package:dynamic_height_list_view/dynamic_height_view.dart';
import 'package:e_commerce_app/providers/wishlist_provider.dart';
import 'package:e_commerce_app/services/assets_manager.dart';
import 'package:e_commerce_app/services/my_app_function.dart';
import 'package:e_commerce_app/widgests/empty_bag.dart';
import 'package:e_commerce_app/widgests/products/product_widget.dart';
import 'package:e_commerce_app/widgests/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = "/WishlistScreen";

  const WishlistScreen({super.key});

  final bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);

    return wishlistProvider.getWishlist.isEmpty
        ? Scaffold(
            body: EmptyBagWidget(
              imagePath: AssetsManager.bagWish,
              title: "Whoopds!",
              subtitle: "Nothing in your wishlist yet",
              buttonText: "Looks like your cart is empty. Add something and make me happy!",
            ),
          )
        : Scaffold(
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  icon: Icon(Icons.arrow_back_ios, size: 20),
                ),
              ),
              title: TitleTextWidget(
                label: "Wishlist (${wishlistProvider.getWishlist.length})",
                fontSize: 20,
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    MyAppFunction.showErrorOrWarningDialog(
                      isError: false,
                      context: context,
                      subtitle: "Clear cart?",
                      fct: () {
                        wishlistProvider.clearLocalWishlist();
                      },
                    );
                  },
                  icon: Icon(IconlyLight.delete, color: Colors.red),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DynamicHeightGridView(
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                builder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ProductWidget(
                      productID: wishlistProvider.getWishlist.values
                          .toList()[index]
                          .productID,
                    ),
                  );
                }),
                itemCount: wishlistProvider.getWishlist.length,
                crossAxisCount: 2,
              ),
            ),
          );
  }
}
