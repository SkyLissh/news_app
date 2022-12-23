import "package:flutter/material.dart";

import "package:news_app/constants/constants.dart";

class NewsCardTheme {
  static CardTheme get theme => _theme();

  static CardTheme _theme() {
    return CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: kBorderRadius,
        side: BorderSide(color: Colors.blueGrey[100]!),
      ),
      elevation: 6,
      shadowColor: Colors.black.withOpacity(0.25),
      color: Colors.white,
    );
  }
}
