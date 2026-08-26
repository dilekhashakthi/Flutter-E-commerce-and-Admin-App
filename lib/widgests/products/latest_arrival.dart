import 'package:e_commerce_app/consts/app_constants.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/providers/cart_provider.dart';
import 'package:e_commerce_app/screens/inner_screens/product_details_screen.dart';
import 'package:e_commerce_app/widgests/products/heart_btn.dart';
import 'package:e_commerce_app/widgests/subtitle_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LatestArrivalProductsWidget extends StatelessWidget {
  const LatestArrivalProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final productsModel = Provider.of<ProductModel>(context);
    final cartProvider = Provider.of<CartProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () async {
          await Navigator.pushNamed(
            context,
            ProductDetailsScreen.routeName,
            arguments: productsModel.productID,
          );
        },
        child: SizedBox(
          width: size.width * 0.45,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: FancyShimmerImage(
                    imageUrl: productsModel.productImage,
                    height: size.height * 0.15,
                    width: size.width * 0.22,
                  ),
                ),
              ),
              SizedBox(width: 8),
              Flexible(
                child: Column(
                  children: [
                    SizedBox(height: 5),
                    Text(
                      productsModel.productTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(width: 5),
                    FittedBox(
                      child: Row(
                        children: [
                          HeartButtonWidget(),
                          IconButton(
                            icon: Icon(
                              cartProvider.isProdInCart(
                                    productID: productsModel.productID,
                                  )
                                  ? Icons.check
                                  : Icons.add_shopping_cart_outlined,
                            ),
                            onPressed: () {
                              if (cartProvider.isProdInCart(
                                productID: productsModel.productID,
                              )) {
                                return;
                              }
                              cartProvider.addProductToCart(
                                productID: productsModel.productID,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 5),
                    FittedBox(
                      child: SubtitleTextWidget(
                        label: "${productsModel.productPrice}\$",
                        fontSize: 14,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
