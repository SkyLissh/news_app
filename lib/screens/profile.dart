import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:go_router/go_router.dart";

import "package:news_app/providers/providers.dart";

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.select((AuthState state) => state.user);

    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Profile"),
            Text("Name: ${user?.name}"),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                context.read<AuthNotifier>().logOut();
                context.go("/welcome");
              },
              child: const Text("Sign Out"),
            ),
          ],
        ),
      ),
    );
  }
}
