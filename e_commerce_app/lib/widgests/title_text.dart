import 'package:flutter/material.dart';

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({
    super.key,
    required this.label,
    required this.fontSize,
    this.color,
    this.maxLine,
  });

  final String label;
  final double fontSize;
  final Color? color;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      maxLines: maxLine,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
