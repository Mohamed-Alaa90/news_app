import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/theme/theme_app.dart';
import 'package:news_app/features/category/data/models/category_item_model.dart';
import 'package:provider/provider.dart';

import '../provider/gategory_item_provider.dart';

class CategoryItemCard extends StatelessWidget
{

    CategoryItemCard({super.key, required this.categoryItemModel, required this.index});
    final CategoryItemModel categoryItemModel;
    int index;
    @override
    Widget build(BuildContext context)
    {

        return Container(
            margin: EdgeInsets.all(6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(index.isEven ? 25 : 0),
                    bottomRight: Radius.circular(index.isOdd ? 25 : 0),
                    topLeft: Radius.circular(25.r),
                    topRight: Radius.circular(25.r)

                ),
                color: categoryItemModel.backGroundColor
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                    Image.asset(categoryItemModel.imagePath,height: 110.h ,width: 110.h),
                    SizedBox(height: 6.h),
                    Text(categoryItemModel.title,
                        style: ThemeApp.myTheme.textTheme.titleMedium
                    )
                ]
            )
        );
    }
}
