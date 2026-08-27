import 'package:dynamic_height_list_view/dynamic_height_view.dart';
import 'package:e_commerce_app/providers/viewd_recenly_provider.dart';
import 'package:e_commerce_app/services/assets_manager.dart';
import 'package:e_commerce_app/services/my_app_function.dart';
import 'package:e_commerce_app/widgests/empty_bag.dart';
import 'package:e_commerce_app/widgests/products/product_widget.dart';
import 'package:e_commerce_app/widgests/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class ViewedRecentlyScreen extends StatelessWidget {
  static const routeName = "/ViewedRecentlyScreen";

  const ViewedRecentlyScreen({super.key});

  final bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    final viewdRecenlyProvider = Provider.of<ViewdRecenlyProvider>(context);

    return viewdRecenlyProvider.getViewdRecenly.isEmpty
        ? Scaffold(
            body: EmptyBagWidget(
              imagePath: AssetsManager.orderBag,
              title: "Whoopds!",
              subtitle: "No viwed products yet",
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
                label:
                    "Viewd recently (${viewdRecenlyProvider.getViewdRecenly.length})",
                fontSize: 20,
              ),
              actions: [
                IconButton(
                  icon: Icon(IconlyLight.delete, color: Colors.red),
                  onPressed: () {
                    // MyAppFunction.showErrorOrWarningDialog(
                    //   isError: false,
                    //   context: context,
                    //   subtitle: "Clear cart?",
                    //   fct: () {
                    //     viewdRecenlyProvider.clearLocalWishlist();
                    //   },
                    // );
                  },
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
                    padding: const EdgeInsets.all(12),
                    child: ProductWidget(
                      productID: viewdRecenlyProvider.getViewdRecenly.values
                          .toList()[index]
                          .productID,
                    ),
                  );
                }),
                itemCount: viewdRecenlyProvider.getViewdRecenly.length,
                crossAxisCount: 2,
              ),
            ),
          );
  }
}
