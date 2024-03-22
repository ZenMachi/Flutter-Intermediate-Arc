import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:story_app/common/constants.dart';
import 'package:story_app/features/authentication/ui/login_page.dart';
import 'package:story_app/features/authentication/ui/register_page.dart';
import 'package:story_app/features/story/ui/story_page.dart';
import 'package:story_app/routes/app_routes.dart';

class HomePage extends StatefulWidget {
  final Widget child;

  const HomePage({super.key, required this.child});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex(context),
        destinations: _bottomNavBarItems,
        onDestinationSelected: onTap,
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
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
