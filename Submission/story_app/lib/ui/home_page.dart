import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:story_app/common/constants.dart';
import 'package:story_app/localization/localization.dart';

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
        destinations: _bottomNavBarItems(context),
        onDestinationSelected: onTap,
      ),
      body: widget.child,
    );
  }

  List<NavigationDestination> _bottomNavBarItems(BuildContext context) {
    final content = AppLocalizations.of(context)!;
    return [
      NavigationDestination(
        icon: const Icon(Icons.home_outlined),
        selectedIcon: const Icon(Icons.home),
        label: content.navbarNameHome,
      ),
      NavigationDestination(
        icon: const Icon(Icons.add_outlined),
        selectedIcon: const Icon(Icons.add),
        label: content.navbarNameAdd,
      ),
      NavigationDestination(
        icon: const Icon(Icons.settings_outlined),
        selectedIcon: const Icon(Icons.settings),
        label: content.navbarNameSettings,
      ),
    ];
  }

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
