import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:news_app/core/constant/color_app.dart';
import 'package:news_app/core/network_helper/api_manager.dart';
import 'package:news_app/generated/assets.dart';
import 'package:news_app/news/news_item.dart';

class SearchScreen extends SearchDelegate {
  static String route = "/search";


  @override
  List<Widget>? buildActions(BuildContext context) {
    
    return [
      
      IconButton(
        onPressed: () {
          showResults(context);
        },
        icon: const Icon(Icons.search),
      ),
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults();
  }

  Widget _buildSearchResults() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(Assets.assetsBackGround),
        ),
      ),
      child: FutureBuilder(
        future: ApiManager.getSearch(query), 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                color: ColorsApp.primerColor,
                size: 100,
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('حدث خطأ أثناء جلب البيانات'));
          } else if (!snapshot.hasData ||
              snapshot.data == null ||
              snapshot.data!.articles!.isEmpty) {
            return const Center(child: Text('البحث'));
          } else {
            var newsList = snapshot.data!.articles;
            return ListView.builder(
              itemCount: newsList?.length,
              itemBuilder:
                  (context, index) => NewsItem(article: newsList![index]),
            );
          }
        },
      ),
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      scaffoldBackgroundColor: Colors.white,
      inputDecorationTheme: const InputDecorationTheme(),
      hintColor: Colors.white,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.white,
      ),
      focusColor: Colors.white,
    );
  }
}
