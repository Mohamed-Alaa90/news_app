import 'package:flutter/animation.dart';

class CategoryItemModel
{
    String categoryId;
    String title;
    String imagePath;
    Color backGroundColor;

    CategoryItemModel
    (
    {
        required this.categoryId,
        required this.title,
        required this.imagePath,
        required this.backGroundColor
    }
    );
}
