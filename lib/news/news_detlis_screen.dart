import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:news_app/core/constant/color_app.dart';
import 'package:news_app/model/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({super.key, this.article});

  static const String route = "/NewsDetailsScreen";
  final Article? article;

  @override
  Widget build(BuildContext context) {
    var article = ModalRoute.of(context)?.settings.arguments as Article;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(fit: BoxFit.cover, image: AssetImage("assets/backGround.png")),
      ),
      child: Scaffold(
        appBar: AppBar(title: Text(article.author ?? "")),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    //   padding: EdgeInsets.all(15),
                    margin: const EdgeInsets.all(15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Hero(
                        tag: article.urlToImage!, // Unique tag for Hero animation
                        child: AspectRatio(
                          aspectRatio: 16 / 9, // Maintain aspect ratio
                          child: CachedNetworkImage(
                            imageUrl: article.urlToImage!,
                            fit: BoxFit.cover,
                            placeholder:
                                (context, url) => Center(
                                  child: LoadingAnimationWidget.staggeredDotsWave(
                                    color: ColorsApp.primerColor,
                                    size: 50,
                                  ),
                                ),
                            errorWidget:
                                (context, url, error) => const Icon(Icons.broken_image, size: 50, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(article.source?.name ?? "", style: Theme.of(context).textTheme.bodySmall),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(left: 11.0),
                    child: Text(article.title ?? "", style: Theme.of(context).textTheme.bodyMedium),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(right: 11.0),
                    child: Text(
                      article.publishedAt != null
                          ? DateFormat('EEEE, dd MMM yyyy - hh:mm a').format(DateTime.parse(article.publishedAt!))
                          : "No Date",
                      style: Theme.of(context).textTheme.titleSmall,
                      textAlign: TextAlign.end,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    margin: const EdgeInsets.all(15),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      border: Border.all(color: Colors.black12, width: 1.5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          //   textAlign: TextAlign.center,
                          article.description ?? "not description",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 100),
                        TextButton(
                          onPressed: () async {
                            Uri url = Uri.parse(article.url ?? "not found");
                            if (await canLaunchUrl(url)) {
                              launchUrl(url, mode: LaunchMode.externalApplication);
                            }
                          },
                          child: Text(
                            "View full Article",
                            textAlign: TextAlign.end,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
