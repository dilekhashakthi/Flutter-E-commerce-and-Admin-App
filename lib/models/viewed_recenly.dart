import 'package:flutter/material.dart';

class ViewedRecenlyModel with ChangeNotifier {
  final String viewedProdID;
  final String productID;

  ViewedRecenlyModel({
    required this.viewedProdID,
    required this.productID,
  });
}
