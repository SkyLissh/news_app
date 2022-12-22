import "package:flutter/material.dart";

class SquareButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;

  const SquareButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        minimumSize: const Size(50, 50),
        maximumSize: const Size(50, 50),
        padding: EdgeInsets.zero,
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
