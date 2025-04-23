import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/theme/theme_app.dart';
import 'package:news_app/model/category_model.dart';

class CategoryItemCard extends StatelessWidget {
  const CategoryItemCard({
    super.key,
    required this.categoryItemModel,
    required this.index,
  });

  final CategoryItemModel categoryItemModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6.w),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(index.isEven ? 25.r : 0.r),
            bottomRight: Radius.circular(index.isOdd ? 25.r : 0.r),
            topLeft: Radius.circular(25.r),
            topRight: Radius.circular(25.r),
          ),
          color: categoryItemModel.backGroundColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: Image.asset(
                categoryItemModel.imagePath,
                height: 100.h,
                width: 100.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 6.h),
            FittedBox(
              child: Text(
                categoryItemModel.title,
                style: ThemeApp.myTheme(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
