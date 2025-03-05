import 'package:flutter/animation.dart';

import '../core/constant/color_app.dart';
import '../generated/assets.dart';

class CategoryItemModel
{
    String categoryId;
    String title;
    String imagePath;
    Color backGroundColor;

    CategoryItemModel({
        required this.categoryId,
        required this.title,
        required this.imagePath,
        required this.backGroundColor
    });

    static List<CategoryItemModel> getCategories()
    {

        return
        [
            CategoryItemModel(
                categoryId: "sports",
                title: "Sports",
                imagePath: Assets.assetsSports,
                backGroundColor: ColorsApp.redColor
            ),
            CategoryItemModel(
                categoryId: "general",
                title: "General",
                imagePath: Assets.assetsPolitics,
                backGroundColor: ColorsApp.blueColor
            ),
            CategoryItemModel(
                categoryId: "health",
                title: "Health",
                imagePath: Assets.assetsHealth,
                backGroundColor: ColorsApp.pinkColor
            ),
            CategoryItemModel(
                categoryId: "business",
                title: "Business",
                imagePath: Assets.assetsBussines,
                backGroundColor: ColorsApp.brownColor
            ),
            CategoryItemModel(
                categoryId: "entertainment",
                title: "Entertainment",
                imagePath: Assets.assetsEnvironment,
                backGroundColor: ColorsApp.blueBColor
            ),
            CategoryItemModel(
                categoryId: "science",
                title: "Science",
                imagePath: Assets.assetsScience,
                backGroundColor: ColorsApp.yellowColor
            )
        ];
    }
}
