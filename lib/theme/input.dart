import "package:flutter/material.dart";

import "package:news_app/constants/constants.dart";

class NewsInputTheme {
  static InputDecorationTheme get theme => _theme();

  static final _border = OutlineInputBorder(
    borderRadius: kBorderRadius,
    borderSide: BorderSide(color: Colors.blue[800]!),
  );

  static InputDecorationTheme _theme() {
    return InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      enabledBorder: _border.copyWith(borderSide: BorderSide.none),
      border: _border,
      errorBorder:
          _border.copyWith(borderSide: BorderSide(color: Colors.red[800]!)),
      focusedBorder: _border,
      filled: true,
      hintStyle: kTextNormal.copyWith(color: Colors.blueGrey[400]!),
      errorStyle: kTextNormal.copyWith(color: Colors.red[800]!, fontSize: 12.0),
      labelStyle: MaterialStateTextStyle.resolveWith(
        (states) => kTextNormal.copyWith(
          color: states.contains(MaterialState.focused)
              ? Colors.blue[800]!
              : Colors.blueGrey[400]!,
        ),
      ),
      prefixIconColor: MaterialStateColor.resolveWith(
        (states) => states.contains(MaterialState.focused)
            ? Colors.blue[800]!
            : Colors.blueGrey[400]!,
      ),
      suffixIconColor: MaterialStateColor.resolveWith(
        (states) => states.contains(MaterialState.focused)
            ? Colors.blue[800]!
            : Colors.blueGrey[400]!,
      ),
      fillColor: Colors.blue[800]!.withOpacity(0.1),
    );
  }
}
