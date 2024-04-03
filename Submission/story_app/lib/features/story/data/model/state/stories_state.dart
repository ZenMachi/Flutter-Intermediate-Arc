import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_app/features/story/data/model/stories/story.dart';
part 'stories_state.freezed.dart';

@freezed
class StoriesState with _$StoriesState {
  const factory StoriesState.initial() = StoriesStateInitial;
  const factory StoriesState.loading() = StoriesStateLoading;
  const factory StoriesState.loaded(List<Story> listData) = StoriesStateLoaded;
  const factory StoriesState.error(String message) = StoriesStateError;
}
