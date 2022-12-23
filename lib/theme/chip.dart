import "package:flutter/material.dart";

class NewsChipTheme {
  static ChipThemeData get theme => _theme();

  static ChipThemeData _theme() {
    return ChipThemeData(
      labelPadding: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      backgroundColor: Colors.blueGrey[50],
      pressElevation: 0,
      labelStyle: const TextStyle(
        color: Colors.blueGrey,
        fontWeight: FontWeight.w500,
      ),
      secondaryLabelStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      selectedColor: Colors.blue[800],
    );
  }
}
