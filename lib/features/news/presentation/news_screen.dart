import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:news_app/core/network_helper/api_manager.dart';
import 'package:news_app/features/news/model/news_model.dart';
import 'package:news_app/features/news/widget/news_item.dart';
import 'package:news_app/features/sources/models/source_respon.dart';

import '../../../core/constant/color_app.dart';

class NewsScreen extends StatefulWidget
{
    final Source source;

    const NewsScreen({super.key, required this.source});

    @override
    State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen>
{
    late Future<NewsModel?> futureNews;

    @override
    void initState()
    {
        super.initState();
        futureNews = ApiManager.getNewsById(widget.source.id!);
    }

    void _retryFetchNews()
    {
        setState(()
            {
                futureNews = ApiManager.getNewsById(widget.source.id!);
            }
        );
    }

    @override
    Widget build(BuildContext context)
    {
        return FutureBuilder<NewsModel?>(
            future: futureNews,
            builder: (context, snapshot)
            {
                if (snapshot.connectionState == ConnectionState.waiting)
                {
                    return Center(child: LoadingAnimationWidget.halfTriangleDot(color: ColorsApp.primerColor, size: 50));
                }
                else if (snapshot.hasError)
                {
                    return _buildErrorWidget("Error: ${snapshot.error}");
                }
                else if (snapshot.data?.status != 'ok')
                {
                    return _buildErrorWidget(snapshot.data?.message ?? "Unknown error");
                }

                var newsList = snapshot.data?.articles ?? [];
                if (newsList.isEmpty)
                {
                    return _buildErrorWidget("No News Available");
                }

                return ListView.builder(
                    itemBuilder: (context, index)
                    {
                        return NewsItem(article: newsList[index]);
                    }

                );
            }
        );
    }

    Widget _buildErrorWidget(String message)
    {
        return Center(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                    Text(message, style: const TextStyle(color: Colors.red)),
                    const SizedBox(height: 10),
                    ElevatedButton(onPressed: _retryFetchNews, child: const Text("Try Again"))
                ]
            )
        );
    }
}
