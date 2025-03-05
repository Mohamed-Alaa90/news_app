import 'package:flutter/material.dart';
import 'package:news_app/category/category_item_card.dart';
import 'package:news_app/model/category_model.dart';

class CategoryFragment extends StatelessWidget {
  CategoryFragment({super.key, required this.onCategoryItemClick});
  final categoryList = CategoryItemModel.getCategories();
  final Function(CategoryItemModel) onCategoryItemClick; 

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 30.0, bottom: 30),
          child: Text("اختر الفئة التي تهمك", 
              style: Theme.of(context).textTheme.bodyLarge),
        ),
        Expanded(
          child: GridView.builder(
            itemCount: categoryList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  onCategoryItemClick(categoryList[index]); 
                },
                child: CategoryItemCard(
                    categoryItemModel: categoryList[index], index: index
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
