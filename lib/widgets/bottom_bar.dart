import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final _routes = const ["/", "/profile"];
  int get _currentIndex => _indexLocation(GoRouter.of(context).location);

  int _indexLocation(String location) {
    final index = _routes.indexWhere((element) => element == location);

    return index == -1 ? 0 : index;
  }

  void _onTap(int index) {
    if (_currentIndex == index) return;

    context.go(_routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onTap,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        // TODO: Add Saved Screen
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.bookmark),
        //   label: "Saved",
        // ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Settings",
        ),
      ],
    );
  }
}
