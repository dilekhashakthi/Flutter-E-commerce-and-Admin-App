import 'package:dynamic_height_list_view/dynamic_height_view.dart';
import 'package:e_commerce_app/services/assets_manager.dart';
import 'package:e_commerce_app/widgests/empty_bag.dart';
import 'package:e_commerce_app/widgests/products/product_widget.dart';
import 'package:e_commerce_app/widgests/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ViewedRecentlyScreen extends StatelessWidget {
  static const routeName = "/ViewedRecentlyScreen";

  const ViewedRecentlyScreen({super.key});

  final bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    return isEmpty
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
              title: TitleTextWidget(label: "Viewd recently", fontSize: 20),
              actions: [
                IconButton(
                  onPressed: () {
                    // Handle delete action
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
                  return ProductWidget();
                }),
                itemCount: 200,
                crossAxisCount: 2,
              ),
            ),
          );
  }
}
