import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "package:news_app/providers/providers.dart";
import "package:news_app/widgets/widgets.dart";

class NewsList extends StatefulWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final _scroll = ScrollController();

  @override
  void initState() {
    super.initState();

    _scroll.addListener(() {
      final max = _scroll.position.maxScrollExtent - 500;
      if (_scroll.position.pixels >= max) {
        context.read<NewsNotifier>().getNews();
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final news = context.read<NewsState>().news;

    if (news.isEmpty) {
      context.read<NewsNotifier>().getNews();
    }
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final news = context.select((NewsState n) => n.news);
    final hasMore = context.select((NewsState n) => n.hasMore);

    if (news.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListView.builder(
        controller: _scroll,
        itemCount: news.length,
        itemBuilder: (context, index) {
          final article = news[index];

          if (index == news.length - 1 && hasMore) {
            return Column(
              children: [
                NewsCard(article: article),
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ],
            );
          }

          return NewsCard(article: article);
        },
      ),
    );
  }
}
