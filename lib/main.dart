import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:flutter_state_notifier/flutter_state_notifier.dart";

import "package:firebase_core/firebase_core.dart";
import "package:firebase_database/firebase_database.dart";
import "firebase_options.dart";

import "package:news_app/router.dart";
import "package:news_app/theme/theme.dart";
import "package:news_app/providers/providers.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseDatabase.instance.setPersistenceEnabled(true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StateNotifierProvider<AuthNotifier, AuthState>(
          create: (_) => AuthNotifier(),
        ),
      ],
      child: MaterialApp.router(
        title: "News App",
        debugShowCheckedModeBanner: false,
        theme: NewsTheme.theme,
        routerConfig: NewsRouter.routerConfig,
      ),
    );
  }
}
