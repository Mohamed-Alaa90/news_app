import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/theme/theme_app.dart';
import 'package:news_app/home_screen.dart';
import 'package:news_app/news/news_detlis_screen.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeApp.myTheme(context),
          initialRoute: HomeScreen.route,
          routes: {
            HomeScreen.route: (context) => const HomeScreen(),
            NewsDetailsScreen.route: (context) => const NewsDetailsScreen(),
          },
        );
      },
    );
  }
}
