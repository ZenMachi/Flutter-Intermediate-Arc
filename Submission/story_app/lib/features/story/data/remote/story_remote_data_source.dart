import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' show Client;
import 'package:story_app/common/constants.dart';
import 'package:story_app/features/authentication/data/local/auth_local_data_source.dart';
import 'package:story_app/features/story/data/remote/model/detail_story_response.dart';
import 'package:story_app/features/story/data/remote/model/stories_response.dart';

class StoryRemoteDataSource {
  final Client client;
  final AuthLocalDataSource localDataSource;

  StoryRemoteDataSource(this.client, this.localDataSource);

  Future<StoriesResponse> getStories() async {
    final user = await localDataSource.getUser();
    final token = user?.token;
    final queryParams = {
      "page": "1",
      "size": "5",
      "location": "1",
    };
    final headers = {HttpHeaders.authorizationHeader: "Bearer $token"};
    final uri = Uri.https(
      ApiLinks.baseUrl,
      ApiLinks.storyEndpoint,
      queryParams,
    );
    final response = await client.get(uri, headers: headers);

    if (response.statusCode == 200) {
      return StoriesResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Stories');
    }
  }

  Future<DetailStoryResponse> getDetailStory(String id) async {
    final user = await localDataSource.getUser();
    final token = user?.token;
    final headers = {HttpHeaders.authorizationHeader: "Bearer $token"};
    final uri = Uri.https(
      ApiLinks.baseUrl,
      "${ApiLinks.storyEndpoint}/$id",
    );
    final response = await client.get(uri, headers: headers);

    if (response.statusCode == 200) {
      return DetailStoryResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Detail Story');
    }
  }
}
