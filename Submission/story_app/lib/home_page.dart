import 'package:flutter/material.dart';
import 'package:story_app/features/authentication/ui/register_page.dart';
import 'package:story_app/features/story/ui/story_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stories'),
      ),
      body: StoryPage()
    );
  }
}
