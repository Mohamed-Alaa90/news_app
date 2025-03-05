import 'package:flutter/material.dart';
import 'package:news_app/category/category_details_screen.dart';
import 'package:news_app/category/category_fragment.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/search/search_screen.dart';
import 'core/theme/theme_app.dart';
import 'core/widget/drawer_app.dart';

class HomeScreen extends StatefulWidget {
  static const String route = "/home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchScreen());
              },
              icon: const Icon(Icons.search),
            ),
          ],
          title: Text(
            selectedCategory == null ? "اﻷخبار" : selectedCategory!.title,
            style: ThemeApp.myTheme(context).textTheme.titleMedium,
          ),
        ),
        drawer: DrawerApp(onSideMenuItemClick: onSideMenuItemClick),

        body:
            selectedCategory == null
                ? CategoryFragment(onCategoryItemClick: onCategoryItemClick)
                : CategoryDetailsScreen(categoryItemModel: selectedCategory!),
      ),
    );
  }

  CategoryItemModel? selectedCategory;

  void onCategoryItemClick(CategoryItemModel newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  int selectedMenuItem = 0;

  void onSideMenuItemClick(int newSelectedMenuItem) {
    selectedMenuItem = newSelectedMenuItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
