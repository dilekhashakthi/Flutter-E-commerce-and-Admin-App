import 'package:e_commerce_app/providers/cart_provider.dart';
import 'package:e_commerce_app/providers/product_provider.dart';
import 'package:e_commerce_app/widgests/app_name_text.dart';
import 'package:e_commerce_app/widgests/products/heart_btn.dart';
import 'package:e_commerce_app/widgests/subtitle_text.dart';
import 'package:e_commerce_app/widgests/title_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const routeName = "/ProductDetailsScreen";

  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final productsProvider = Provider.of<ProductProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);

    String? productID = ModalRoute.of(context)!.settings.arguments as String?;
    final getCurrProduct = productsProvider.findByProdId(productID!);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
          icon: Icon(Icons.arrow_back_ios, size: 20),
        ),
        title: AppNameTextWidget(),
      ),
      body: getCurrProduct == null
          ? SizedBox.shrink()
          : SingleChildScrollView(
              child: Column(
                children: [
                  FancyShimmerImage(
                    imageUrl: getCurrProduct.productImage,
                    height: size.height * 0.38,
                    width: double.infinity,
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                getCurrProduct.productTitle,
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(width: 18),
                            SubtitleTextWidget(
                              label: "${getCurrProduct.productPrice}\$",
                              fontSize: 20,
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              HeartButtonWidget(
                                productID: getCurrProduct.productID,
                                bgColor: Colors.blue.shade300,
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: SizedBox(
                                  height: kBottomNavigationBarHeight - 10,
                                  child: ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    icon: Icon(
                                      cartProvider.isProdInCart(
                                            productID: getCurrProduct.productID,
                                          )
                                          ? Icons.check
                                          : Icons.add_shopping_cart_outlined,
                                    ),
                                    label: Text(
                                      cartProvider.isProdInCart(
                                            productID: getCurrProduct.productID,
                                          )
                                          ? "In cart"
                                          : "Add to cart",
                                    ),
                                    onPressed: () {
                                      if (cartProvider.isProdInCart(
                                        productID: getCurrProduct.productID,
                                      )) {
                                        return;
                                      }
                                      cartProvider.addProductToCart(
                                        productID: getCurrProduct.productID,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TitleTextWidget(
                              label: "About this item",
                              fontSize: 16,
                            ),
                            SubtitleTextWidget(
                              label: "In ${getCurrProduct.productCategory}",
                              fontSize: 16,
                            ),
                          ],
                        ),
                        SizedBox(height: 25),
                        SubtitleTextWidget(
                          label: getCurrProduct.productDescription,
                          fontSize: 14,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
