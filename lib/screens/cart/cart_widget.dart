import 'package:e_commerce_app/consts/app_constants.dart';
import 'package:e_commerce_app/screens/cart/quantity_btm_sheet.dart';
import 'package:e_commerce_app/widgests/products/heart_btn.dart';
import 'package:e_commerce_app/widgests/subtitle_text.dart';
import 'package:e_commerce_app/widgests/title_text.dart';
import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return FittedBox(
      child: IntrinsicWidth(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: FancyShimmerImage(
                  imageUrl: AppConstants.imageUrl,
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
                            label: "Title" * 10,
                            fontSize: 25,
                            maxLine: 2,
                          ),
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.clear, color: Colors.red),
                            ),
                            HeartButtonWidget()
                          ],
                        ),
                      ],
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SubtitleTextWidget(
                          label: "16.00\$",
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
                                return QuantityBottomSheetWidget();
                              },
                            );
                          },
                          icon: Icon(IconlyLight.arrowDown2),
                          label: Text("QYt: 6"),
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
