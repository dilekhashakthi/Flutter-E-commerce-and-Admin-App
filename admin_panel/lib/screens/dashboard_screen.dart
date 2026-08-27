import 'package:aa/models/dashboard_btns_model.dart';
import 'package:aa/widgets/dashboard_btns.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import '../services/assets_manager.dart';
import '../widgets/title_text.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/DashboardScreen';
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const TitlesTextWidget(label: "Dashboard Screen"),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssetsManager.shoppingCart),
        ),
        actions: [
          IconButton(
            onPressed: () {
              themeProvider.setDarkTheme(
                themeValue: !themeProvider.getIsDarkTheme,
              );
            },
            icon: Icon(
              themeProvider.getIsDarkTheme ? Icons.light_mode : Icons.dark_mode,
            ),
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          DashboardButtonsModel.dashboartBtnList(context).length,
          (index) => DashboardButtonsWidget(
            imagePath: DashboardButtonsModel.dashboartBtnList(
              context,
            )[index].imagePath,
            text: DashboardButtonsModel.dashboartBtnList(context)[index].text,
            onPressed: DashboardButtonsModel.dashboartBtnList(
              context,
            )[index].onPressed,
          ),
        ),
      ),
    );
  }
}
