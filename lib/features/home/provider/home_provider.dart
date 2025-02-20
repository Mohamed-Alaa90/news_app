import 'package:flutter/material.dart';
import 'package:news_app/features/category/presentation/category_screen.dart';
import 'package:news_app/features/setting/presentation/setting_screen.dart';

enum MenuItem
{
    category, setting
}

class HomeProvider extends ChangeNotifier
{
    Widget selectedWidget = const CategoryScreen();

    void onMenuItemClicked(MenuItem item, BuildContext context)
    {
        if (item == MenuItem.category) 
        {
            selectedWidget = const CategoryScreen();
        }
        else if (item == MenuItem.setting) 
        {
            selectedWidget = const SettingScreen();
        }

        Navigator.pop(context);
        notifyListeners();
    }
}
