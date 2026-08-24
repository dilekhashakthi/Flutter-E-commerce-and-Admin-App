import 'package:card_swiper/card_swiper.dart';
import 'package:e_commerce_app/consts/app_constants.dart';
import 'package:e_commerce_app/services/assets_manager.dart';
import 'package:e_commerce_app/widgests/app_name_text.dart';
import 'package:e_commerce_app/widgests/products/latest_arrival.dart';
import 'package:e_commerce_app/widgests/title_text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssetsManager.shoppingCart),
        ),
        title: AppNameTextWidget(),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.25,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    AppConstants.bannerImages[index],
                    fit: BoxFit.fill,
                  );
                },
                itemCount: AppConstants.bannerImages.length,
                pagination: SwiperPagination(
                  builder: DotSwiperPaginationBuilder(activeColor: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 15),
            TitleTextWidget(label: "Latest arrival", fontSize: 15),
            SizedBox(height: 15),
            SizedBox(
              height: size.height * 0.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return LatestArrivalProductsWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
