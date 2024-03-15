import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' show Client;
import 'package:story_app/features/story/data/model/detail_story_response.dart';
import 'package:story_app/features/story/data/model/stories_response.dart';

class RemoteDataSource {
  static const _baseUrl = "story-api.dicoding.dev";
  static const _storyEndpoint = "/v1/stories";

  final Client client;

  RemoteDataSource(this.client);

  Future<StoriesResponse> getStories() async {
    final queryParams = {
      "page": "1",
      "size": "5",
      "location": "1",
    };
    final headers = {
      HttpHeaders.authorizationHeader: "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJ1c2VyLXBWUGN4WjNGMXVXTWZQSUoiLCJpYXQiOjE3MTA0MTgxMzd9.D_GQr81w2gEMX4N1CHvjRaRICnRmoyD8P4014vMEe74"
    };
    final uri = Uri.https(_baseUrl, _storyEndpoint, queryParams);
    final response = await client.get(
      uri,
      headers: headers
    );

    if (response.statusCode == 200) {
      return StoriesResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Stories');
    }
  }

  Future<DetailStoryResponse> getDetailStory(String id) async {
    final headers = {
      HttpHeaders.authorizationHeader: "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJ1c2VyLXBWUGN4WjNGMXVXTWZQSUoiLCJpYXQiOjE3MTA0MTgxMzd9.D_GQr81w2gEMX4N1CHvjRaRICnRmoyD8P4014vMEe74"
    };
    final uri = Uri.https(_baseUrl, "$_storyEndpoint/$id");
    final response = await client.get(
      uri,
      headers: headers
    );

    if (response.statusCode == 200) {
      return DetailStoryResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Detail Story');
    }
  }
}
