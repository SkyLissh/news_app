import "package:flutter/material.dart";

import "package:news_app/constants/constants.dart";

class NewsElevatedButtonTheme {
  static ElevatedButtonThemeData get theme => _theme();

  static ElevatedButtonThemeData _theme() {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.blue[800]),
        elevation: MaterialStateProperty.all(10.0),
        shadowColor: MaterialStateProperty.all(Colors.blue[500]),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: kBorderRadius,
          ),
        ),
        minimumSize:
            MaterialStateProperty.all(const Size(double.infinity, 50.0)),
        textStyle: MaterialStateProperty.all(kTextNormal),
      ),
    );
  }
}
