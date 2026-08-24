import 'package:e_commerce_app/consts/app_constants.dart';
import 'package:e_commerce_app/widgests/app_name_text.dart';
import 'package:e_commerce_app/widgests/subtitle_text.dart';
import 'package:e_commerce_app/widgests/title_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            FancyShimmerImage(
              imageUrl: AppConstants.imageUrl,
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
                          "Title" * 18,
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(width: 18),
                      SubtitleTextWidget(
                        label: "1550.00\$",
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
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blue.shade300,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            style: IconButton.styleFrom(elevation: 10),
                            onPressed: () {},
                            icon: Icon(IconlyLight.heart),
                          ),
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
                              onPressed: () {},
                              icon: Icon(Icons.add_shopping_cart),
                              label: Text("Add to cart"),
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
                      TitleTextWidget(label: "About this item", fontSize: 16),
                      SubtitleTextWidget(label: "In Phone", fontSize: 16),
                    ],
                  ),
                  SizedBox(height: 25),
                  SubtitleTextWidget(label: "Description" * 100, fontSize: 14),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
