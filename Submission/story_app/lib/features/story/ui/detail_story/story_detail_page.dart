import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:story_app/features/story/provider/story_provider.dart';
import 'package:story_app/localization/localization.dart';
import 'package:story_app/utils/result_state.dart';
import 'package:story_app/widgets/error_page.dart';
import 'package:story_app/widgets/loading_page.dart';

class StoryDetailPage extends StatefulWidget {
  final String id;

  const StoryDetailPage({super.key, required this.id});

  @override
  State<StoryDetailPage> createState() => _StoryDetailPageState();
}

class _StoryDetailPageState extends State<StoryDetailPage> {
  @override
  Widget build(BuildContext context) {
    final content = AppLocalizations.of(context)!;

    return Consumer<StoryProvider>(
      builder: (context, provider, child) {
        final state = provider.detailStoryState;

        return state.map(
          initial: (value) {
            return const LoadingPage();
          },
          loading: (value) {
            return const LoadingPage();
          },
          loaded: (value) {
            final data = value.data;
            return Scaffold(
              appBar: AppBar(
                title: Text(content.titleAppBarDetails),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.my_location_rounded),
                  )
                ],
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Image.network(
                      data.photoUrl,
                      fit: BoxFit.contain,
                      width: 100.w,
                      height: 480,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Text(
                          data.name,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.apply(fontWeightDelta: 2),
                        ),
                        Text(
                          data.description,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          content.createdAt(data.createdAt),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        SizedBox(
                          height: 2.h,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          error: (value) {
            return ErrorPage(error: value.message);
          },
        );

        // if (provider.state == ResultState.loading) {
        //   return const LoadingPage();
        // } else if (provider.state == ResultState.hasData) {
        //   final photoUrl = provider.storyDetailResult.story.photoUrl;
        //   final name = provider.storyDetailResult.story.name;
        //   final description = provider.storyDetailResult.story.description;
        //   final createdAt = provider.storyDetailResult.story.createdAt;
        //
        //   return Scaffold(
        //     appBar: AppBar(
        //       title: Text(content.titleAppBarDetails),
        //     ),
        //     body: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Flexible(
        //           child: Image.network(
        //             photoUrl,
        //             fit: BoxFit.contain,
        //             width: 100.w,
        //             height: 480,
        //           ),
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.symmetric(horizontal: 8),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               const SizedBox(height: 8),
        //               Text(
        //                 name,
        //                 style: Theme.of(context)
        //                     .textTheme
        //                     .bodyLarge
        //                     ?.apply(fontWeightDelta: 2),
        //               ),
        //               Text(
        //                 description,
        //                 style: Theme.of(context).textTheme.bodyMedium,
        //               ),
        //               const SizedBox(height: 8),
        //               Text(
        //                 content.createdAt(createdAt),
        //                 style: Theme.of(context).textTheme.bodySmall,
        //               ),
        //               SizedBox(
        //                 height: 2.h,
        //               )
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //   );
        // } else if (provider.state == ResultState.noData) {
        //   return ErrorPage(error: provider.message);
        // } else if (provider.state == ResultState.error) {
        //   return ErrorPage(error: "Error -> ${provider.message}");
        // } else {
        //   return ErrorPage(error: content.unknownError);
        // }
      },
    );
  }
}
