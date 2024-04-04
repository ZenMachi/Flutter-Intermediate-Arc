import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:story_app/common/constants.dart';
import 'package:story_app/features/story/provider/story_provider.dart';
import 'package:story_app/features/story/widgets/card_story.dart';
import 'package:story_app/localization/localization.dart';
import 'package:story_app/widgets/error_page.dart';
import 'package:story_app/widgets/loading_page.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    final provider = context.read<StoryProvider>();

    controller.addListener(() {
      if (controller.position.pixels >= controller.position.maxScrollExtent) {
        if (provider.pageItems != null) {
          provider.fetchStories(false);
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final content = AppLocalizations.of(context)!;

    return Consumer<StoryProvider>(
      builder: (context, provider, child) {
        final state = provider.storiesState;

        return state.map(
          initial: (value) {
            return const LoadingPage();
          },
          loading: (value) {
            return const LoadingPage();
          },
          loaded: (value) {
            final data = value.listData;
            return NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder: (context, isScrolled) => [
                SliverAppBar(
                  title: Text(content.titleAppBarRoot),
                  floating: true,
                  actions: [
                    IconButton(
                      onPressed: () {
                        context.goNamed(Routes.maps);
                      },
                      icon: const Icon(Icons.maps_home_work_rounded),
                    ),
                  ],
                )
              ],
              body: SafeArea(
                child: ListView.separated(
                  controller: controller,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemCount: data.length + (provider.pageItems != null ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == data.length && provider.pageItems != null) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    final id = data[index].id;
                    final params = {"id": id};

                    return CardStory(
                      onTap: () {
                        provider.fetchDetailStory(id);
                        context.goNamed(
                          Routes.storyDetails,
                          pathParameters: params,
                        );
                      },
                      name: data[index].name,
                      description: data[index].description,
                      imgUrl: data[index].photoUrl,
                    );
                  },
                ),
              ),
            );
          },
          error: (value) {
            return ErrorPage(error: value.message);
          },
        );
      },
    );
  }
}
