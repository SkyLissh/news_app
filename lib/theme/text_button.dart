import "package:flutter/material.dart";

import "package:news_app/constants/constants.dart";

class NewsTextButtonTheme {
  static TextButtonThemeData get theme => _theme();

  static TextButtonThemeData _theme() {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.blue[800],
        shape: const RoundedRectangleBorder(
          borderRadius: kBorderRadius,
        ),
      ),
    );
  }
}
