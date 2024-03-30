import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_app/features/story/data/model/stories/story.dart';

part 'detail_story_response.g.dart';
part 'detail_story_response.freezed.dart';

@freezed
class DetailStoryResponse with _$DetailStoryResponse {
  const factory DetailStoryResponse({
    @JsonKey(name: "error") required bool error,
    @JsonKey(name: "message") required String message,
    @JsonKey(name: "story") required Story story,
  }) = _DetailStoryResponse;

  factory DetailStoryResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailStoryResponseFromJson(json);
}
