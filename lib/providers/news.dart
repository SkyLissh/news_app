import "package:flutter/widgets.dart";
import "package:state_notifier/state_notifier.dart";

class NewsState {
  final String country;

  NewsState(this.country);
}

class NewsNotifier extends StateNotifier<NewsState> {
  static final _locale = WidgetsBinding.instance.window.locale;
  static final _country = _locale.countryCode!.toLowerCase();

  NewsNotifier() : super(NewsState(_country));

  void setCountry(String country) {
    state = NewsState(country);
  }
}
