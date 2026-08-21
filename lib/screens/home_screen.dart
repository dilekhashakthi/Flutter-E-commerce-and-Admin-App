// import 'package:e_commerce_app/consts/app_colors.dart';
import 'package:e_commerce_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      // backgroundColor: AppColors.lightScaffoldColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hello world",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
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
