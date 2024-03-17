import 'package:story_app/features/story/data/remote/model/story.dart';

class DetailStoryResponse {
  bool error;
  String message;
  Story story;

  DetailStoryResponse({
    required this.error,
    required this.message,
    required this.story,
  });


  factory DetailStoryResponse.fromJson(Map<String, dynamic> json) => DetailStoryResponse(
    error: json["error"],
    message: json["message"],
    story: Story.fromJson(json["story"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "story": story.toJson(),
  };
}


