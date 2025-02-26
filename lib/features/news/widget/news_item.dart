import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:news_app/features/news/model/news_model.dart';

import '../../../core/constant/color_app.dart';

class NewsItem extends StatelessWidget
{
    const NewsItem({super.key, required this.article});
    final Article article;
    @override
    Widget build(BuildContext context)
    {
        return Card(
            color: Colors.white60,
          child: Padding(
              padding: const EdgeInsets.all(11.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(20),
          
                          child:
                          CachedNetworkImage(
                              imageUrl: article.urlToImage ?? "",
                              width: double.infinity,
                              height: 250.h,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Center(
                                  child: LoadingAnimationWidget.halfTriangleDot(
                                      color: ColorsApp.primerColor,
                                      size: 50
                                  )
                              )
                              ,
                              errorWidget: (context, url, error) => const Icon(Icons.error)
                          )
          
          
          
                      ),
                      SizedBox(height: 5.h),
                      Text(article.author ?? "", style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 16)),
                       SizedBox(height: 5.h),
                      Text(article.title ?? "", style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.black)),
                      SizedBox(height: 5.h),
                      Text(article.publishedAt ?? "", style: Theme.of(context).textTheme.titleSmall, textAlign: TextAlign.end)
          
                  ]
              )
          
          ),
        );
    }
}
