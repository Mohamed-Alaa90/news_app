import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/theme/theme_app.dart';
import 'package:news_app/features/category/provider/gategory_item_provider.dart';
import 'package:news_app/features/home/presentation/home_screen.dart';
import 'package:news_app/features/setting/presentation/setting_screen.dart';
import 'package:news_app/features/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

import 'features/splash/presentation/splash_screen.dart';
import 'features/splash/provider/splash_provider.dart';

void main()
{
    runApp(
        MultiProvider(
            providers: [
                ChangeNotifierProvider(create: (context) => HomeProvider()),
                ChangeNotifierProvider(create: (context) => CategoryProvider()),
                ChangeNotifierProvider(create: (_) => SplashProvider())
            ],
            child: MyApp()
        )
    );
}

class MyApp extends StatelessWidget
{
    const MyApp({super.key});

    @override
    Widget build(BuildContext context)
    {
        return ScreenUtilInit(
            builder: (context, child)
            {
                return MaterialApp(
                    theme: ThemeApp.myTheme,
                    initialRoute: SplashScreen.route,
                    routes:
                    {
                        SplashScreen.route:(context) => SplashScreen(),
                        HomeScreen.route:(context) => HomeScreen(),
                        SettingScreen.route:(context) => SettingScreen()
                    }
                );
            },
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true
        // Use builder only (
        );
    }
}
