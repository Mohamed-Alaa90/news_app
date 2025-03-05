import 'package:flutter/foundation.dart';
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
  bool isLoading = false;
  late Future<void> futureNews;

  @override
  void initState() {
    super.initState();
    futureNews = _fetchData();
    listController.addListener(() {
      if (listController.position.pixels >= listController.position.maxScrollExtent - 100) {
        nextPage();
      }
    });
  }

  @override
  void didUpdateWidget(covariant NewWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.source.id != widget.source.id) {
      pageNumber = 1;
      newsList.clear();
      lastPage = false;
      futureNews = _fetchData();
    }
  }

  Future<void> _fetchData() async {
    if (isLoading || lastPage || newsList.length >= 100) return;

    setState(() => isLoading = true);

    try {
      var response = await ApiManager.getNewsById(widget.source.id ?? '', pageNumber.toString());

      if (response != null && response.articles != null) {
        setState(() {
          if (response.articles!.isEmpty || newsList.length + response.articles!.length >= 100) {
            lastPage = true;
          }
          newsList.addAll(response.articles!);
        });
      } else {
        lastPage = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print("❌ خطأ أثناء جلب البيانات: $e");
      }
    }

    setState(() => isLoading = false);
  }

  void nextPage() {
    if (!lastPage && !isLoading) {
      pageNumber++;
      futureNews = _fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(fit: BoxFit.cover, image: AssetImage("assets/backGround.png")),
      ),
      child: Scaffold(
        body: FutureBuilder<void>(
          future: futureNews,
          builder: (context, snapshot) {
            if (newsList.isEmpty && snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: LoadingAnimationWidget.staggeredDotsWave(color: ColorsApp.primerColor, size: 100));
            } else if (snapshot.hasError) {
              return Center(child: AppHelper.fetchDataAgain(_fetchData));
            } else if (newsList.isEmpty) {
              return const Center(child: Text('لا توجد بيانات متاحة'));
            } else {
              return ListView.builder(
                controller: listController,
                itemCount: newsList.length + (isLoading ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == newsList.length) {
                    return Center(
                      child: LoadingAnimationWidget.staggeredDotsWave(color: ColorsApp.primerColor, size: 50),
                    );
                  }
                  return NewsItem(article: newsList[index]);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
