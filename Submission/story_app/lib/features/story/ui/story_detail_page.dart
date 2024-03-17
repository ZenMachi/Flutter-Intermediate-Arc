import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:story_app/features/story/provider/story_provider.dart';
import 'package:story_app/utils/date_time_extension.dart';
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
    return Consumer<StoryProvider>(
      builder: (context, provider, child) {
        if (provider.state == ResultState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (provider.state == ResultState.hasData) {
          final photoUrl = provider.storyDetailResult.story.photoUrl;
          final name = provider.storyDetailResult.story.name;
          final description = provider.storyDetailResult.story.description;
          final createdAt =
              provider.storyDetailResult.story.createdAt.toIndFormat();

          return Scaffold(
            appBar: AppBar(
              title: Text('Detail'),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  photoUrl,
                  fit: BoxFit.fitWidth,
                  width: 100.w,
                  height: 480,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        name,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.apply(fontWeightDelta: 2),
                      ),
                      Text(
                        description,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: 8,),
                      Text(createdAt, style: Theme.of(context).textTheme.bodySmall,),
                    ],
                  ),
                ),
              ],
            ),
          );
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
  }
}
