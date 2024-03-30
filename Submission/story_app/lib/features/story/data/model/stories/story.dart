import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_app/features/story/data/model/stories/converter/date_converter.dart';

part 'story.g.dart';

part 'story.freezed.dart';

@freezed
class Story with _$Story {
  const factory Story({
    @JsonKey(name: "id") required String id,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "description") required String description,
    @JsonKey(name: "photoUrl") required String photoUrl,
    @JsonKey(name: "createdAt")
    @Iso8601DateTimeConverter()
    required DateTime createdAt,
    @JsonKey(name: "lat") double? lat,
    @JsonKey(name: "lon") double? lon,
  }) = _Story;

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);
}
