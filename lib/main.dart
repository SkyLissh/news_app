import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

import "package:news_app/theme/theme.dart";
import "package:news_app/screens/screens.dart";

import "package:firebase_core/firebase_core.dart";
import "firebase_options.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
