import "package:flutter/material.dart";
import "package:flag/flag.dart";

class CountryIcon extends StatelessWidget {
  final String country;
  final double size;

  const CountryIcon(this.country, {Key? key, this.size = 24}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Flag.fromString(country,
          height: size, width: size, fit: BoxFit.cover),
    );
  }
}
