import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

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
                    color: Colors.blue[800]?.withOpacity(0.3),
                    colorBlendMode: BlendMode.darken,
                  ),
                ),
                if (showBackButton)
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SquareButton(
                      onPressed: () => context.pop(),
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
