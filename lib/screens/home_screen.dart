import 'package:e_commerce_app/providers/theme_provider.dart';
import 'package:e_commerce_app/widgests/subtitle_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SubtitleTextWidget(label: "Hello"),
            ElevatedButton(onPressed: () {}, child: Text("Hello world")),
            SwitchListTile(
              title: Text(
                themeProvider.getIsDarkTheme ? "Dark Theme" : "Light Theme",
              ),
              value: themeProvider.getIsDarkTheme,
              onChanged: (value) {
                themeProvider.setDarkTheme(themeValue: value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
