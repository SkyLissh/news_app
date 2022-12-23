import "dart:convert";

import "package:flutter/widgets.dart";
import "package:http/http.dart" as http;
import "package:state_notifier/state_notifier.dart";

import "package:news_app/env.dart";
import "package:news_app/models/models.dart";

class NewsState {
  final List<Article> news;
  final String country;
  final String category;
  final int page;
  final bool hasMore;

  NewsState(this.country, this.news,
      {this.category = "general", this.page = 1, this.hasMore = true});
}

class NewsNotifier extends StateNotifier<NewsState> {
  static final _locale = WidgetsBinding.instance.window.locale;
  static final _country = _locale.countryCode!.toLowerCase();

  static bool _loading = false;
  static int _maxPage = 0;

  NewsNotifier() : super(NewsState(_country, []));

  void setCountry(String country) {
    state = NewsState(country, [], category: state.category);
  }

  void setCategory(String category) {
    state = NewsState(state.country, [], category: category);
  }

  void _reachMaxPage() {
    _loading = false;
    _maxPage = state.page;

    state = NewsState(
      state.country,
      state.news,
      category: state.category,
      page: state.page,
      hasMore: false,
    );
  }

  void getNews() async {
    if (_loading || _maxPage == state.page) return;

    final url = Uri.https("newsapi.org", "/v2/top-headlines", {
      "country": state.country,
      "category": state.category,
      "page": "${state.page}",
      "pageSize": "20",
      "apiKey": Env.newsApiKey,
    });

    _loading = true;

    final res = await http.get(url);

    if (res.statusCode != 200) {
      if (res.statusCode == 429) {
        _reachMaxPage();
      }

      return;
    }

    final data = NewsResponse.fromJson(jsonDecode(res.body));

    print("News: ${data.articles.length}");

    if (data.articles.isEmpty) {
      _reachMaxPage();
      return;
    }

    state = NewsState(
      state.country,
      [...state.news, ...data.articles],
      category: state.category,
      page: state.page + 1,
    );

    _loading = false;
  }
}
