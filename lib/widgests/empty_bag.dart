import 'package:e_commerce_app/widgests/subtitle_text.dart';
import 'package:e_commerce_app/widgests/title_text.dart';
import 'package:flutter/material.dart';

class EmptyBagWidget extends StatelessWidget {
  final String imagePath, title, subtitle, buttonText;

  const EmptyBagWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: 50),
          Image.asset(
            imagePath,
            width: double.infinity,
            height: size.height * 0.35,
          ),
          SizedBox(height: 20),
          TitleTextWidget(label: title, fontSize: 40, color: Colors.red),
          SizedBox(height: 20),
          SubtitleTextWidget(
            label: subtitle,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SubtitleTextWidget(
              label: buttonText,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
            ),
            onPressed: () {},
            child: Text("Shop Now"),
          ),
        ],
      ),
    );
  }
}
