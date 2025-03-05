import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:news_app/model/news_model.dart';
import 'package:intl/intl.dart';
import 'package:news_app/news/news_detlis_screen.dart';
import '../core/constant/color_app.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap:
            () => Navigator.pushNamed(
              context,
              NewsDetailsScreen.route,
              arguments: article,
            ),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
                spreadRadius: 2,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Hero(
                  tag: article.urlToImage!, // Unique tag for Hero animation
                  child: AspectRatio(
                    aspectRatio: 16 / 9, // Maintain aspect ratio
                    child: CachedNetworkImage(
                      imageUrl: article.urlToImage!,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(
                        child: LoadingAnimationWidget.staggeredDotsWave(
                          color: ColorsApp.primerColor,
                          size: 50,
                        ),
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.broken_image,
                        size: 50,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Text(
                article.source?.name ?? "No Title",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                article.title ?? "No Title",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 5),

              Text(
                article.publishedAt != null
                    ? DateFormat(
                      'EEEE, dd MMM yyyy - hh:mm a',
                    ).format(DateTime.parse(article.publishedAt!))
                    : "No Date",
                style: const TextStyle(fontSize: 12, color: Colors.grey),
                textAlign: TextAlign.end,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
