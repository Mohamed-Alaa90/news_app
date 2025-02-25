import 'package:flutter/material.dart';
import 'package:news_app/features/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/theme_app.dart';
import '../widget/drawer_app.dart';

class HomeScreen extends StatelessWidget {
  static const String route = "/home";

  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/backGround.png"),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "News",
            style: ThemeApp.myTheme(context).textTheme.titleMedium,
          ),
        ),
        drawer: DrawerApp(onMenuItemClicked: homeProvider.onMenuItemClicked),

        body: homeProvider.selectedWidget,
      ),
    );
  }
}
