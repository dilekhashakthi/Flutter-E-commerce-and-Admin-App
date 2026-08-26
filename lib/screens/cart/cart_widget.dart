import 'package:e_commerce_app/models/cart_model.dart';
import 'package:e_commerce_app/providers/cart_provider.dart';
import 'package:e_commerce_app/providers/product_provider.dart';
import 'package:e_commerce_app/screens/cart/quantity_btm_sheet.dart';
import 'package:e_commerce_app/widgests/products/heart_btn.dart';
import 'package:e_commerce_app/widgests/subtitle_text.dart';
import 'package:e_commerce_app/widgests/title_text.dart';
import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final cartModel = Provider.of<CartModel>(context);
    final cartProvider = Provider.of<CartProvider>(context);

    final productsProvider = Provider.of<ProductProvider>(context);
    final getCurrProduct = productsProvider.findByProdId(cartModel.productID);

    return getCurrProduct == null
        ? SizedBox.shrink()
        : FittedBox(
            child: IntrinsicWidth(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: FancyShimmerImage(
                        imageUrl: getCurrProduct.productImage,
                        height: size.height * 0.2,
                        width: size.height * 0.2,
                      ),
                    ),
                    SizedBox(width: 10),
                    IntrinsicWidth(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: size.width * 0.6,
                                child: TitleTextWidget(
                                  label: getCurrProduct.productTitle,
                                  fontSize: 25,
                                  maxLine: 2,
                                ),
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.clear, color: Colors.red),
                                    onPressed: () {
                                      cartProvider.removeOneItem(
                                        productID: getCurrProduct.productID,
                                      );
                                    },
                                  ),
                                  HeartButtonWidget(),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SubtitleTextWidget(
                                label: "${getCurrProduct.productPrice}\$",
                                color: Colors.blue,
                              ),
                              Spacer(),
                              OutlinedButton.icon(
                                onPressed: () async {
                                  await showModalBottomSheet(
                                    backgroundColor: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30),
                                      ),
                                    ),
                                    context: context,
                                    builder: (context) {
                                      return QuantityBottomSheetWidget(
                                        cartModel: cartModel,
                                      );
                                    },
                                  );
                                },
                                icon: Icon(IconlyLight.arrowDown2),
                                label: Text("QYt: ${cartModel.quantity}"),
                                // style: OutlinedButton.styleFrom(
                                //   side: BorderSide(width: 1),
                                //   shape: RoundedRectangleBorder(
                                //     borderRadius: BorderRadius.circular(30.00),
                                //   ),
                                // ),
                              ),
                            ],
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
