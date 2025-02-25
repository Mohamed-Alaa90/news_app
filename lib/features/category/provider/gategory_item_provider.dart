import 'package:flutter/material.dart';
import 'package:news_app/generated/assets.dart';

import '../../../core/constant/color_app.dart';
import '../data/models/category_item_model.dart';

class CategoryProvider extends ChangeNotifier {
  List<CategoryItemModel> categories = [
    CategoryItemModel(
      categoryId: "sports",
      title: "Sports",
      imagePath: Assets.assetsSports,
      backGroundColor: ColorsApp.redColor,
    ),
    CategoryItemModel(
      categoryId: "general",
      title: "General",
      imagePath: Assets.assetsPolitics,
      backGroundColor: ColorsApp.blueColor,
    ),
    CategoryItemModel(
      categoryId: "health",
      title: "Health",
      imagePath: Assets.assetsHealth,
      backGroundColor: ColorsApp.pinkColor,
    ),
    CategoryItemModel(
      categoryId: "business",
      title: "Business",
      imagePath: Assets.assetsBussines,
      backGroundColor: ColorsApp.brownColor,
    ),
    CategoryItemModel(
      categoryId: "entertainment",
      title: "Entertainment",
      imagePath: Assets.assetsEnvironment,
      backGroundColor: ColorsApp.blueBColor,
    ),
    CategoryItemModel(
      categoryId: "science",
      title: "Science",
      imagePath: Assets.assetsScience,
      backGroundColor: ColorsApp.yellowColor,
    ),
  ];

}
