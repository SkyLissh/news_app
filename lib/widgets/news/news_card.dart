import "package:flutter/material.dart";

import "package:news_app/models/models.dart";
import 'package:news_app/widgets/news/news.dart';

class NewsCard extends StatelessWidget {
  final Article article;

  const NewsCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        Padding(
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
      ]),
    );
  }
}
