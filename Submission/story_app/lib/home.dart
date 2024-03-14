import 'package:flutter/material.dart';
import 'package:story_app/widgets/card_story.dart';

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView(
          children: [
            CardStory(onTap: () {},),
            CardStory(onTap: () {},),
            CardStory(onTap: () {},),
          ],
        ),
      ),
    );
  }
}
