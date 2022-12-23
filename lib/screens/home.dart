import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "package:news_app/providers/providers.dart";
import "package:news_app/widgets/widgets.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final country = context.select((NewsState n) => n.country);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text("Home", style: TextStyle(color: Colors.black)),
        actions: [CountryButton(country)],
      ),
      body: Center(
        child: Text("Home: $country"),
      ),
    );
  }
}
