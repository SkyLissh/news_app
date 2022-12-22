import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

import "package:news_app/theme/theme.dart";
import "package:news_app/screens/screens.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "News App",
      debugShowCheckedModeBanner: false,
      theme: NewsTheme.theme,
      routerConfig: _router,
    );
  }
}

final _router = GoRouter(initialLocation: "/welcome", routes: [
  GoRoute(path: "/", builder: (context, state) => const HomeScreen()),
  GoRoute(
      path: "/welcome",
      builder: (context, state) => const WelcomeScreen(),
      routes: [
        GoRoute(
            path: "login", builder: (context, state) => const LogInScreen()),
        GoRoute(
            path: "signup", builder: (context, state) => const SignUpScreen()),
      ]),
]);
