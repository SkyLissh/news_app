import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "package:news_app/providers/providers.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.select((AuthState state) => state.user);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Text("${user?.name}"),
      ),
    );
  }
}
