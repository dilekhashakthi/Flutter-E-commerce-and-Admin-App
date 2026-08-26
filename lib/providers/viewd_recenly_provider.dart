import 'package:e_commerce_app/models/viewed_recenly.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ViewdRecenlyProvider with ChangeNotifier {
  final Map<String, ViewedRecenlyModel> _viewedRecenlyItems = {};
  Map<String, ViewedRecenlyModel> get getViewdRecenly {
    return _viewedRecenlyItems;
  }

  void addViewdRecenly({required String productID}) {
    _viewedRecenlyItems.putIfAbsent(
      productID,
      () => ViewedRecenlyModel(viewedProdID: Uuid().v4(), productID: productID),
    );
    notifyListeners();
  }
}
