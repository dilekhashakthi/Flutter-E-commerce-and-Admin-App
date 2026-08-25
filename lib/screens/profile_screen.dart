import 'package:e_commerce_app/providers/theme_provider.dart';
import 'package:e_commerce_app/screens/inner_screens/viewed_recently.dart';
import 'package:e_commerce_app/screens/inner_screens/wishlist.dart';
import 'package:e_commerce_app/services/assets_manager.dart';
import 'package:e_commerce_app/services/my_app_function.dart';
import 'package:e_commerce_app/widgests/app_name_text.dart';
import 'package:e_commerce_app/widgests/subtitle_text.dart';
import 'package:e_commerce_app/widgests/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssetsManager.shoppingCart),
        ),
        title: AppNameTextWidget(),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Visibility(
              visible: false,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: TitleTextWidget(
                  label: "Please login to have unlimited access",
                  fontSize: 20,
                ),
              ),
            ),
            Visibility(
              visible: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 5.0,
                ),
                child: Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).cardColor,
                        border: Border.all(color: Colors.lightBlue, width: 3.0),
                      ),
                      child: ClipOval(
                        child: Image.network(
                          "https://i.pravatar.cc/150?img=12",
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(
                              Icons.person,
                              size: 38,
                              color: Theme.of(context).colorScheme.primary,
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleTextWidget(label: "Dilekha Shakthi", fontSize: 18),
                        SizedBox(height: 6),
                        SubtitleTextWidget(label: "user@example.com"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(thickness: 1),
                  SizedBox(height: 10),
                  TitleTextWidget(label: "General", fontSize: 18),
                  SizedBox(height: 10),
                  CustomListTile(
                    text: "All Orders",
                    imagePath: AssetsManager.orderSvg,
                    function: () {},
                  ),
                  CustomListTile(
                    text: "Wishlist",
                    imagePath: AssetsManager.wishlistSvg,
                    function: () {
                      Navigator.pushNamed(context, WishlistScreen.routeName);
                    },
                  ),
                  CustomListTile(
                    text: "Viewed Recently",
                    imagePath: AssetsManager.recent,
                    function: () {
                      Navigator.pushNamed(
                        context,
                        ViewedRecentlyScreen.routeName,
                      );
                    },
                  ),
                  CustomListTile(
                    text: "Address",
                    imagePath: AssetsManager.address,
                    function: () {},
                  ),
                  SizedBox(height: 10),
                  Divider(thickness: 1),
                  SizedBox(height: 10),
                  TitleTextWidget(label: "Settings", fontSize: 18),
                  SizedBox(height: 10),
                  SwitchListTile(
                    secondary: Image.asset(AssetsManager.theme, height: 34),
                    title: Text(
                      themeProvider.getIsDarkTheme
                          ? "Dark Theme"
                          : "Light Theme",
                    ),
                    value: themeProvider.getIsDarkTheme,
                    onChanged: (value) {
                      themeProvider.setDarkTheme(themeValue: value);
                    },
                  ),
                ],
              ),
            ),
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                icon: Icon(IconlyLight.login),
                label: Text("Login"),
                onPressed: () async {
                  await MyAppFunction.showErrorOrWarningDialog(
                    context: context,
                    subtitle: "Are you sure you want to signot?",
                    fct: () {},
                    isError: false,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.text,
    required this.imagePath,
    required this.function,
  });

  final String text, imagePath;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        function();
      },
      title: Text(text),
      leading: Image.asset(imagePath, height: 34),
      trailing: Icon(IconlyLight.arrowRight2),
    );
  }
}
