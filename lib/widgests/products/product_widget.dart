import 'package:e_commerce_app/consts/app_constants.dart';
import 'package:e_commerce_app/screens/inner_screens/product_details_screen.dart';
import 'package:e_commerce_app/widgests/products/heart_btn.dart';
import 'package:e_commerce_app/widgests/subtitle_text.dart';
import 'package:e_commerce_app/widgests/title_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatefulWidget {
  const new({super.key});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: GestureDetector(
        onTap: () async {
          await Navigator.pushNamed(context, ProductDetailsScreen.routeName);
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FancyShimmerImage(
                imageUrl: AppConstants.imageUrl,
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
                      label: "Title" * 10,
                      fontSize: 18,
                      maxLine: 2,
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: HeartButtonWidget()
                  ),
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
                      label: "1550\$",
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
                        onTap: () {},
                        splashColor: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Icon(
                            Icons.add_shopping_cart_outlined,
                            size: 16,
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
