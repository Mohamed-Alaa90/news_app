import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import '../../../core/constant/color_app.dart';
import '../../../generated/assets.dart';
import '../../home/presentation/home_screen.dart';
import '../provider/splash_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const String route = "/splash";

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashProvider>(
      builder: (context, splashProvider, child) {
        if (!splashProvider.isLoading) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
          });
        }

        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(image: AssetImage(Assets.assetsBackGround)),
          ),
          child: Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Assets.assetsLogo),
                  LoadingAnimationWidget.halfTriangleDot(color: ColorsApp.primerColor, size: 50),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
