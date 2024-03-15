import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_app/features/story/provider/api_provider.dart';
import 'package:story_app/features/story/widgets/card_story.dart';
import 'package:story_app/utils/result_state.dart';

class StoryPage extends StatelessWidget {
  const StoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Consumer<ApiProvider>(
        builder: (context, provider, child) {
          if (provider.state == ResultState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (provider.state == ResultState.hasData) {
            return ListView.builder(
                itemCount: provider.storiesResult.listStory.length,
                itemBuilder: (context, index) {
                  return CardStory(
                    onTap: () {},
                    name: provider.storiesResult.listStory[index].name,
                    description:
                        provider.storiesResult.listStory[index].description,
                    imgUrl: provider.storiesResult.listStory[index].photoUrl,
                  );
                });
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
      ),
    );
  }
}
