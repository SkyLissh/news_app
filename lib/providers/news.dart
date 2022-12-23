import "package:flutter/widgets.dart";
import "package:state_notifier/state_notifier.dart";

class NewsState {
  final String country;
  final String category;

  NewsState(this.country, {this.category = "general"});
}

class NewsNotifier extends StateNotifier<NewsState> {
  static final _locale = WidgetsBinding.instance.window.locale;
  static final _country = _locale.countryCode!.toLowerCase();

  NewsNotifier() : super(NewsState(_country));

  void setCountry(String country) {
    state = NewsState(country, category: state.category);
  }

  void setCategory(String category) {
    state = NewsState(state.country, category: category);
  }
}
