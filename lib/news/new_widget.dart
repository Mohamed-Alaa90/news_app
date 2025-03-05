import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:news_app/core/network_helper/api_manager.dart';
import 'package:news_app/core/utils/app_helper.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/model/source_model.dart';
import 'package:news_app/news/news_item.dart';

import '../core/constant/color_app.dart';

class NewWidget extends StatefulWidget {
  const NewWidget({super.key, required this.source});

  final Source source;

  @override
  State<NewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
  int pageNumber = 1;
  ScrollController listController = ScrollController();
  List<Article> newsList = [];
  bool lastPage = false;
  void _fetchData() {
    setState(() {
      ApiManager.getNewsById(widget.source.id ?? "", pageNumber.toString());
    });
  }

  @override
  void initState() {
    super.initState();
    listController.addListener(() {
      if (listController.position.atEdge && listController.position.pixels != 0) {
        nextPage();
      }
    });
  }

  @override
  void didUpdateWidget(covariant NewWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    pageNumber = 1;
    newsList = [];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(fit: BoxFit.cover, image: AssetImage("assets/backGround.png")),
      ),
      child: Scaffold(
        body: FutureBuilder<NewsModel?>(
          future: ApiManager.getNewsById(widget.source.id ?? '', pageNumber.toString()),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting && newsList.isEmpty) {
              return Center(child: LoadingAnimationWidget.staggeredDotsWave(color: ColorsApp.primerColor, size: 100));
            } else if (snapshot.hasError) {
              return Center(child: AppHelper.fetchDataAgain(_fetchData));
            } else if (!snapshot.hasData || snapshot.data == null) {
              return const Center(child: Text('لا توجد بيانات متاحة'));
            } else {
              if ((snapshot.data?.articles ?? []).isNotEmpty) {
                newsList.addAll(snapshot.data!.articles!);
              }
              return ListView.builder(
                controller: listController,
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  return NewsItem(article: newsList[index]);
                },
              );
            }
          },
        ),
        // body: CategoryDetailsScreen(),
      ),
    );
  }

  void nextPage() {
    pageNumber++;
    setState(() {});
  }
}
