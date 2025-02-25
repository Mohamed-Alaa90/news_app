import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/theme/theme_app.dart';
import 'package:news_app/features/category/widget/category_item_card.dart';
import 'package:provider/provider.dart';

import '../provider/gategory_item_provider.dart';

class CategoryScreen extends StatelessWidget {
  static const String route = "/category";

  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30.h, left: 25.w),
          child: Text(
            "Pick your category\nof interest",
            style: ThemeApp.myTheme(context).textTheme.bodyLarge,
          ),
        ),

        SizedBox(height: 20.h),

        Expanded(
          child: Consumer<CategoryProvider>(
            builder: (context, categoryProvider, child) {
              final category = categoryProvider.categories;

              return GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: category.length,
                itemBuilder:
                    (context, index) => InkWell(
                      onTap: () {},
                      child: CategoryItemCard(
                        index: index,
                        categoryItemModel: category[index],
                      ),
                    ),
              );
            },
          ),
        ),
      ],
    );
  }
}
