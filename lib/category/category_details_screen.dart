import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:news_app/core/network_helper/api_manager.dart';
import 'package:news_app/core/utils/app_helper.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/model/source_model.dart';
import 'package:news_app/tab/tab_widget.dart';

import '../core/constant/color_app.dart';

class CategoryDetailsScreen extends StatefulWidget {
  const CategoryDetailsScreen({super.key, required this.categoryItemModel});

  final CategoryItemModel categoryItemModel;

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  void _fetchData() {
    setState(() {
      ApiManager.getSources(widget.categoryItemModel.categoryId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceRespon?>(
      future: ApiManager.getSources(widget.categoryItemModel.categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: LoadingAnimationWidget.staggeredDotsWave(color: ColorsApp.primerColor, size: 100));
        } else if (snapshot.hasError) {
          return Center(child: AppHelper.fetchDataAgain(_fetchData));
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const Center(child: Text('لا توجد بيانات متاحة'));
        } else {
          var sourceList = snapshot.data?.sources ?? [];
          return TabWidget(sourceList: sourceList);
        }
      },
    );
  }
}
