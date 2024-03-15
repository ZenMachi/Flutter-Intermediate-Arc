import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_app/features/story/provider/api_provider.dart';
import 'package:story_app/features/story/widgets/card_story.dart';
import 'package:story_app/utils/result_state.dart';

class StoryDetailPage extends StatefulWidget {
  final String id;

  const StoryDetailPage({super.key, required this.id});

  @override
  State<StoryDetailPage> createState() => _StoryDetailPageState();
}

class _StoryDetailPageState extends State<StoryDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ApiProvider>(
      builder: (context, provider, child) {
        if (provider.state == ResultState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (provider.state == ResultState.hasData) {
          return CardStory(
              onTap: () {},
              name: provider.storyDetailResult.story.name,
              description: provider.storyDetailResult.story.description,
              imgUrl: provider.storyDetailResult.story.photoUrl);
        } else if (provider.state == ResultState.noData) {
          return Center(
            child: Material(
              child: Text(provider.message),
            ),
          );
        } else if (provider.state == ResultState.error) {
          return Center(
            child: Material(
              child: Text("Error -> ${provider.message}"),
            ),
          );
        } else {
          return const Center(
            child: Text('Unknown Error'),
          );
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Stories'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Icon(Icons.account_circle_rounded),
              SizedBox(
                width: 8,
              ),
              Text("name"),
            ],
          ),
        ],
      ),
    );
  }
}
