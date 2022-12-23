import "package:flutter/material.dart";
import 'package:news_app/widgets/categories.dart';

import "package:news_app/widgets/widgets.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          "Home",
          style: TextStyle(
            color: Colors.blue[800],
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
        actions: const [CountryButton()],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Categories(),
          ],
        ),
      ),
    );
  }
}
