import 'package:e_commerce_app/consts/app_constants.dart';
import 'package:e_commerce_app/screens/inner_screens/product_details_screen.dart';
import 'package:e_commerce_app/widgests/products/heart_btn.dart';
import 'package:e_commerce_app/widgests/subtitle_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class LatestArrivalProductsWidget extends StatelessWidget {
  const LatestArrivalProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () async {
          await Navigator.pushNamed(context, ProductDetailsScreen.routeName);
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
                    imageUrl: AppConstants.imageUrl,
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
                      "Title" * 5,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(width: 5),
                    FittedBox(
                      child: Row(
                        children: [
                          HeartButtonWidget(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add_shopping_cart),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 5),
                    FittedBox(
                      child: SubtitleTextWidget(
                        label: "1550.00\$",
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
