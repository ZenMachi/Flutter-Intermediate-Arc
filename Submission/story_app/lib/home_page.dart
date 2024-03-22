import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:story_app/common/constants.dart';
class HomePage extends StatefulWidget {
  final Widget child;

  const HomePage({super.key, required this.child});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex(context),
        destinations: _bottomNavBarItems,
        onDestinationSelected: onTap,
      ),
      body: widget.child,
    );
  }

  final List<NavigationDestination> _bottomNavBarItems = [
    const NavigationDestination(
      icon: Icon(Icons.home_outlined),
      selectedIcon: Icon(Icons.home),
      label: 'Home',
    ),
    const NavigationDestination(
      icon: Icon(Icons.add_outlined),
      selectedIcon: Icon(Icons.add),
      label: 'Add',
    ),
    const NavigationDestination(
      icon: Icon(Icons.settings_outlined),
      selectedIcon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];

  int _currentIndex(BuildContext context) {
    final route = GoRouterState.of(context);
    final location = route.matchedLocation;

    if (location == Routes.root) return 0;
    if (location == '/${Routes.addStory}') return 1;
    if (location == '/${Routes.settings}') return 2;
    return 0;
  }

  void onTap(int selected) {
    switch (selected) {
      case 0:
        return context.goNamed(Routes.root);
      case 1:
        return context.goNamed(Routes.addStory);
      case 2:
        return context.goNamed(Routes.settings);
      default:
        return context.goNamed(Routes.root);
    }
  }
}
