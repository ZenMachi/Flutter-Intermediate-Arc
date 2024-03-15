import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:story_app/common/constants.dart';
import 'package:story_app/features/authentication/ui/login_page.dart';
import 'package:story_app/features/authentication/ui/register_page.dart';
import 'package:story_app/features/story/ui/story_page.dart';

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
      appBar: AppBar(
        title: Text('Stories'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        items: _bottomNavBarItems,
        onTap: onTap,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      body: widget.child,
    );
  }

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.settings), label: 'Settings'),
  ];

  void onTap(int selected) {
    setState(() {
      _bottomNavIndex = selected;
    });

    switch (selected) {
      case 0:
        return context.go(Routes.root);
      case 1:
        return context.go(Routes.loginNamedPage);
      case 2:
        return context.go(Routes.registerNamedPage);
      default:
        return context.go(Routes.root);
    }
  }

}
