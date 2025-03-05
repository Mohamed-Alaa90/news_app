import 'package:flutter/material.dart';
import 'package:news_app/core/constant/color_app.dart';

class AppHelper {
  static loading() {}

  static fetchDataAgain(VoidCallback? onTap) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Something went wrong, try again",
            style: TextStyle(color: Colors.red, fontSize: 18),
          ),
          const SizedBox(height: 5),
          const Icon(Icons.error),
          const SizedBox(height: 5),

          MaterialButton(
            color: ColorsApp.primerColor,
            onPressed: onTap,
            child: const Text("try again"),
          ),
        ],
      ),
    );
  }
}
