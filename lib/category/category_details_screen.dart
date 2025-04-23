import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:news_app/category/cubit/category_details_view_model.dart';
import 'package:news_app/category/cubit/states.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/tab/tab_widget.dart';
import '../core/constant/color_app.dart';

class CategoryDetailsScreen extends StatefulWidget {
  const CategoryDetailsScreen({super.key, required this.categoryItemModel});

  final CategoryItemModel categoryItemModel;

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  @override
  void initState() {
    super.initState();
    viewModel.getSources(widget.categoryItemModel.categoryId);
  }

  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailsViewModel, SourceStates>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is SourceSuccessState) {
          return TabWidget(sourceList: state.sourceList);
        } else if (state is SourceErrorState) {
          return Center(
            child: Column(
              children: [
                Text(state.errorMessage!),

                MaterialButton(
                  onPressed: () {
                    viewModel.getSources(widget.categoryItemModel.categoryId);
                  },
                  child: const Text('try again'),
                ),
              ],
            ),
          );
        } else if (state is SourceLoadingState) {
          return Center(
            child: LoadingAnimationWidget.staggeredDotsWave(
              color: ColorsApp.primerColor,
              size: 100,
            ),
          );
        }

        return Container();
      },
    );

    // FutureBuilder<SourceRespon?>(
    // future: ApiManager.getSources(widget.categoryItemModel.categoryId),
    // builder: (context, snapshot) {
    //   if (snapshot.connectionState == ConnectionState.waiting) {
    //
    //   } else if (snapshot.hasError) {
    //     return Center(child: AppHelper.fetchDataAgain(_fetchData));
    //   } else if (!snapshot.hasData || snapshot.data == null) {
    //     return const Center(child: Text('لا توجد بيانات متاحة'));
    //   } else {
    //     var sourceList = snapshot.data?.sources ?? [];
    //     return TabWidget(sourceList: sourceList);
    //   }
    // },
    // );
  }
}
