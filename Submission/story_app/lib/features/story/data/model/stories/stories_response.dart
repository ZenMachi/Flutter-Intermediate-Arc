import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_app/features/story/data/model/stories/story.dart';

part 'stories_response.g.dart';

part 'stories_response.freezed.dart';

@freezed
class StoriesResponse with _$StoriesResponse {
  const factory StoriesResponse({
    @JsonKey(name: "error") required bool error,
    @JsonKey(name: "message") required String message,
    @JsonKey(name: "listStory") required List<Story> listStory,
  }) = _StoriesResponse;

  factory StoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$StoriesResponseFromJson(json);
}
