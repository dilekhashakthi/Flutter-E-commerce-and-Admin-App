import 'package:aa/screens/edit_upload_product_form.dart';
import 'package:aa/screens/inner_screen/orders/orders_screen.dart';
import 'package:aa/screens/search_screen.dart';
import 'package:aa/services/assets_manager.dart';
import 'package:flutter/material.dart';

class DashboardButtonsModel {
  final String text, imagePath;
  final Function onPressed;

  DashboardButtonsModel({
    required this.text,
    required this.imagePath,
    required this.onPressed,
  });

  static List<DashboardButtonsModel> dashboartBtnList(dynamic context) => [
    DashboardButtonsModel(
      text: "Add a new product",
      imagePath: AssetsManager.cloud,
      onPressed: () {
        Navigator.pushNamed(context, EditOrUploadProductScreen.routeName);
      },
    ),
    DashboardButtonsModel(
      text: "Inspect all products",
      imagePath: AssetsManager.shoppingCart,
      onPressed: () {
        Navigator.pushNamed(context, SearchScreen.routeName);
      },
    ),
    DashboardButtonsModel(
      text: "Add a new product",
      imagePath: AssetsManager.order,
      onPressed: () {
        Navigator.pushNamed(context, OrdersScreenFree.routeName);
      },
    ),
  ];
}
