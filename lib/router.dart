import "dart:async";

import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:provider/provider.dart";

import "package:news_app/providers/providers.dart";
import "package:news_app/screens/screens.dart";
import "package:news_app/widgets/widgets.dart";

class NewsRouter {
  static final routerConfig = _routerConfig;

  static FutureOr<String?> _authRedirect(
    BuildContext context,
    GoRouterState state,
  ) async {
    final success = await context.read<AuthNotifier>().getUser();
    if (!success && !state.location.contains("welcome")) {
      return "/welcome";
    } else {
      return null;
    }
  }

  static GoRouter get _routerConfig {
    return GoRouter(
      initialLocation: "/",
      redirect: _authRedirect,
      routes: [
        ShellRoute(
          builder: (context, state, child) {
            return Scaffold(
              body: child,
              bottomNavigationBar: const BottomBar(),
            );
          },
          routes: [
            GoRoute(
                path: "/",
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: HomeScreen())),
            GoRoute(
                path: "/profile",
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: ProfileScreen())),
          ],
        ),
        GoRoute(
            path: "/example",
            builder: (context, state) =>
                const Scaffold(body: Center(child: Text("Example")))),
        GoRoute(
          path: "/welcome",
          builder: (context, state) => const WelcomeScreen(),
          routes: [
            GoRoute(
                path: "login",
                builder: (context, state) => const LogInScreen()),
            GoRoute(
                path: "signup",
                builder: (context, state) => const SignUpScreen()),
          ],
        ),
      ],
    );
  }
}
