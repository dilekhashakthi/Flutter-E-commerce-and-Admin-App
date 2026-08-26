import 'package:e_commerce_app/providers/cart_provider.dart';
import 'package:e_commerce_app/providers/product_provider.dart';
import 'package:e_commerce_app/screens/inner_screens/product_details_screen.dart';
import 'package:e_commerce_app/widgests/products/heart_btn.dart';
import 'package:e_commerce_app/widgests/subtitle_text.dart';
import 'package:e_commerce_app/widgests/title_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatefulWidget {
  final String productID;
  const ProductWidget({super.key, required this.productID});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);

    final getCurrProduct = productsProvider.findByProdId(widget.productID);

    Size size = MediaQuery.of(context).size;

    return getCurrProduct == null
        ? SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.all(0.0),
            child: GestureDetector(
              onTap: () async {
                await Navigator.pushNamed(
                  context,
                  ProductDetailsScreen.routeName,
                  arguments: getCurrProduct.productID,
                );
              },
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: FancyShimmerImage(
                      imageUrl: getCurrProduct.productImage,
                      height: size.height * 0.22,
                      width: double.infinity,
                    ),
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 5,
                          child: TitleTextWidget(
                            label: getCurrProduct.productTitle,
                            fontSize: 18,
                            maxLine: 2,
                          ),
                        ),
                        Flexible(flex: 2, child: HeartButtonWidget(
                            productID: getCurrProduct.productID,
                          ),),
                      ],
                    ),
                  ),
                  SizedBox(height: 6),
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                          child: SubtitleTextWidget(
                            label: "${getCurrProduct.productPrice}\$",
                            fontSize: 14,
                            color: Colors.blue,
                          ),
                        ),
                        Flexible(
                          child: Material(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.lightBlue,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () {
                                if (cartProvider.isProdInCart(
                                  productID: getCurrProduct.productID,
                                )) {
                                  return;
                                }
                                cartProvider.addProductToCart(
                                  productID: getCurrProduct.productID,
                                );
                              },
                              splashColor: Colors.red,
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Icon(
                                  cartProvider.isProdInCart(
                                        productID: getCurrProduct.productID,
                                      )
                                      ? Icons.check
                                      : Icons.add_shopping_cart_outlined,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ),
          );
  }
}
