import 'package:aa/widgets/subtitle_text.dart';
import 'package:flutter/material.dart';

class DashboardButtonsWidget extends StatelessWidget {
  final String text, imagePath;
  final Function onPressed;

  const DashboardButtonsWidget({
    super.key,
    required this.text,
    required this.imagePath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imagePath, height: 65, width: 65),
              SizedBox(height: 10),
              SubtitleTextWidget(label: "Subtitle"),
            ],
          ),
        ),
      ),
    );
  }
}
