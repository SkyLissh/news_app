import "package:flutter/material.dart";

import "country_icon.dart";
import "countries.dart";

class CountryList extends StatelessWidget {
  const CountryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: countries.length,
      itemBuilder: (context, index) {
        final country = countries.keys.elementAt(index);
        final name = countries[country]!;

        return ListTile(
          leading: CountryIcon(country, size: 30),
          title: Text(name),
          onTap: () => Navigator.pop(context, country),
        );
      },
    );
  }
}
