import 'package:e_commerce_app/screens/cart_screen.dart';
import 'package:e_commerce_app/screens/home_screen.dart';
import 'package:e_commerce_app/screens/profile_screen.dart';
import 'package:e_commerce_app/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late List<Widget> screens;
  int currentScreen = 0;
  late PageController controller;

  @override
  void initState() {
    super.initState();
    screens = [
      const HomeScreen(),
      const SearchScreen(),
      const CartScreen(),
      const ProfileScreen(),
    ];

    controller = PageController(initialPage: currentScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentScreen,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 10,
        height: kBottomNavigationBarHeight,
        onDestinationSelected: (index) {
          setState(() {
            currentScreen = index;
          });
          controller.jumpToPage(currentScreen);
        },
        destinations: [
          NavigationDestination(
            icon: Icon(IconlyLight.home),
            selectedIcon: Icon(IconlyBold.home),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(IconlyLight.search),
            selectedIcon: Icon(IconlyBold.search),
            label: "Search",
          ),
          NavigationDestination(
            icon: Icon(IconlyLight.bag2),
            selectedIcon: Icon(IconlyBold.bag2),
            label: "Cart",
          ),
          NavigationDestination(
            icon: Icon(IconlyLight.profile),
            selectedIcon: Icon(IconlyBold.profile),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
