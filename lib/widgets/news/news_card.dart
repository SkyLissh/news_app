import "package:flutter/material.dart";

import "package:news_app/models/models.dart";
import "package:url_launcher/url_launcher.dart";

import "package:news_app/widgets/widgets.dart";

class NewsCard extends StatelessWidget {
  final Article article;

  const NewsCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () async {
          if (!await launchUrl(Uri.parse(article.url))) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Could not open article"),
              ),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NewsImage(article.urlToImage),
              const SizedBox(height: 16),
              Text(
                article.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (article.description != null) ...[
                const SizedBox(height: 8),
                Text(
                  article.description!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
              const SizedBox(height: 16),
              NewsDate(article.publishedAt),
            ],
          ),
        ),
      ),
    );
  }
}
