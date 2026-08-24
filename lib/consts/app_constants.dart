import 'package:e_commerce_app/models/categories_model.dart';
import 'package:e_commerce_app/services/assets_manager.dart';

class AppConstants {
  static String imageUrl = "https://pngtree.com/so/shoes";

  static List<String> bannerImages = [
    AssetsManager.banner1,
    AssetsManager.banner2,
  ];

  static List<CategoriesModel> categoriesList = [
    CategoriesModel(id: "Phone", name: "Phone", image: AssetsManager.mobiles),
    CategoriesModel(id: "Laptops", name: "Laptops", image: AssetsManager.pc),
    CategoriesModel(
      id: "Electronics",
      name: "Electronics",
      image: AssetsManager.electronics,
    ),
    CategoriesModel(id: "Watches", name: "Watches", image: AssetsManager.watch),
    CategoriesModel(
      id: "Clothes",
      name: "Clothes",
      image: AssetsManager.fashion,
    ),
    CategoriesModel(id: "Shoes", name: "Shoes", image: AssetsManager.shoes),
    CategoriesModel(id: "Books", name: "Books", image: AssetsManager.book),
    CategoriesModel(
      id: "Cosmatics",
      name: "Cosmatics",
      image: AssetsManager.cosmetics,
    ),
  ];
}
