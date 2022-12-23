import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:go_router/go_router.dart";

import "package:news_app/providers/providers.dart";

import "buttons/buttons.dart";

class WelcomeLayout extends StatelessWidget {
  final String imageUrl;
  final double imageHeight;
  final bool showBackButton;
  final Widget child;

  const WelcomeLayout({
    Key? key,
    required this.imageUrl,
    required this.child,
    this.showBackButton = false,
    this.imageHeight = 400.0,
  }) : super(key: key);

  void _onBack(BuildContext context) {
    context.pop();
    context.read<AuthNotifier>().resetInvalid();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    height: imageHeight,
                    width: double.infinity,
                  ),
                ),
                if (showBackButton)
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SquareButton(
                      onPressed: () => _onBack(context),
                      child: const Icon(
                        Icons.chevron_left,
                        size: 28,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          child: child,
        )
      ],
    );
  }
}
