import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import 'package:news_app/constants/constants.dart';

import "elevated_button.dart";
import "input.dart";
import "text_button.dart";

class NewsTheme {
  static ThemeData get theme => _theme();

  static ThemeData _theme() {
    return ThemeData.light().copyWith(
      primaryColor: Colors.blue[800],
      colorScheme: const ColorScheme.light().copyWith(
        primary: Colors.blue[800],
        secondary: Colors.blue[800],
      ),
      unselectedWidgetColor: Colors.blueGrey[400],
      elevatedButtonTheme: NewsElevatedButtonTheme.theme,
      textButtonTheme: NewsTextButtonTheme.theme,
      inputDecorationTheme: NewsInputTheme.theme,
      textTheme: GoogleFonts.ralewayTextTheme().copyWith(
        subtitle1: kTextNormal,
        button: kTextNormal.copyWith(color: Colors.white),
      ),
    );
  }
}
