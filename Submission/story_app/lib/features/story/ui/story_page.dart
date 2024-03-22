import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:story_app/common/constants.dart';
import 'package:story_app/features/story/provider/story_provider.dart';
import 'package:story_app/features/story/widgets/card_story.dart';
import 'package:story_app/utils/result_state.dart';
import 'package:story_app/widgets/error_page.dart';
import 'package:story_app/widgets/loading_page.dart';

class StoryPage extends StatelessWidget {
  const StoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StoryProvider>(
      builder: (context, provider, child) {
        if (provider.state == ResultState.loading) {
          return const LoadingPage();
        } else if (provider.state == ResultState.hasData) {
          return NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, isScrolled) => [
              SliverAppBar(
                title: Text('My Stories'),
                floating: true,
              )
            ],
            body: SafeArea(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 8),
                separatorBuilder: (context, index) => SizedBox(height: 12),
                itemCount: provider.storiesResult.listStory.length,
                itemBuilder: (context, index) {
                  final id = provider.storiesResult.listStory[index].id;
                  final params = {"id": id};

                  return CardStory(
                    onTap: () {
                      provider.fetchDetailStory(id);
                      context.pushNamed(
                        Routes.storyDetails,
                        pathParameters: params,
                      );
                    },
                    name: provider.storiesResult.listStory[index].name,
                    description:
                        provider.storiesResult.listStory[index].description,
                    imgUrl: provider.storiesResult.listStory[index].photoUrl,
                  );
                },
              ),
            ),
          );
        } else if (provider.state == ResultState.noData) {
          return ErrorPage(error: provider.message);
        } else if (provider.state == ResultState.error) {
          return ErrorPage(error: "Error -> ${provider.message}");
        } else {
          return const ErrorPage(error: 'Unknown Error');
        }
      },
    );
  }
}
