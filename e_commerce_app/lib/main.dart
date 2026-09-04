import 'package:e_commerce_app/consts/theme_data.dart';
import 'package:e_commerce_app/providers/cart_provider.dart';
import 'package:e_commerce_app/providers/product_provider.dart';
import 'package:e_commerce_app/providers/theme_provider.dart';
import 'package:e_commerce_app/providers/viewd_recenly_provider.dart';
import 'package:e_commerce_app/providers/wishlist_provider.dart';
import 'package:e_commerce_app/root_screen.dart';
import 'package:e_commerce_app/screens/auth/forgot_password.dart';
import 'package:e_commerce_app/screens/auth/login.dart';
import 'package:e_commerce_app/screens/auth/register.dart';
import 'package:e_commerce_app/screens/inner_screens/orders/orders_screen.dart';
import 'package:e_commerce_app/screens/inner_screens/product_details_screen.dart';
import 'package:e_commerce_app/screens/inner_screens/viewed_recently.dart';
import 'package:e_commerce_app/screens/inner_screens/wishlist.dart';
import 'package:e_commerce_app/screens/search_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(body: Center(child: CircularProgressIndicator())),
          );
        } else if (snapshot.hasError) {
          return MaterialApp(
            home: Scaffold(
              body: Center(child: SelectableText(snapshot.error.toString())),
            ),
          );
        }
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) {
                return ThemeProvider();
              },
            ),
            ChangeNotifierProvider(
              create: (_) {
                return ProductProvider();
              },
            ),
            ChangeNotifierProvider(
              create: (_) {
                return CartProvider();
              },
            ),
            ChangeNotifierProvider(
              create: (_) {
                return WishlistProvider();
              },
            ),
            ChangeNotifierProvider(
              create: (_) {
                return ViewdRecenlyProvider();
              },
            ),
          ],
          child: Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return MaterialApp(
                title: 'Shopmart E-commerce App',
                theme: Styles.themeData(
                  isDarkTheme: themeProvider.getIsDarkTheme,
                  context: context,
                ),
                debugShowCheckedModeBanner: false,
                home: const RootScreen(),
                // home: const LoginScreen(),
                routes: {
                  RootScreen.routeName: (context) => const RootScreen(),
                  ProductDetailsScreen.routeName: (context) =>
                      const ProductDetailsScreen(),
                  ViewedRecentlyScreen.routeName: (context) =>
                      const ViewedRecentlyScreen(),
                  WishlistScreen.routeName: (context) => const WishlistScreen(),
                  LoginScreen.routeName: (context) => const LoginScreen(),
                  RegisterScreen.routeName: (context) => const RegisterScreen(),
                  OrdersScreenFree.routeName: (context) =>
                      const OrdersScreenFree(),
                  ForgotPasswordScreen.routeName: (context) =>
                      const ForgotPasswordScreen(),
                  SearchScreen.routeName: (context) => const SearchScreen(),
                },
              );
            },
          ),
        );
      },
    );
  }
}
