import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_app/features/story/data/model/stories/story.dart';
part 'detail_story_state.freezed.dart';

@freezed
class DetailStoryState with _$DetailStoryState {
  const factory DetailStoryState.initial() = DetailStoryStateInitial;
  const factory DetailStoryState.loading() = DetailStoryStateLoading;
  const factory DetailStoryState.loaded(Story data) = DetailStoryStateLoaded;
  const factory DetailStoryState.error(String message) = DetailStoryStateError;
}
