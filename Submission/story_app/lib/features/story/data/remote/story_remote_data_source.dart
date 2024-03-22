import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart'
    show Client, MultipartFile, MultipartRequest, StreamedResponse;
import 'package:story_app/common/constants.dart';
import 'package:story_app/features/authentication/data/local/auth_local_data_source.dart';
import 'package:story_app/features/story/data/remote/model/detail_story_response.dart';
import 'package:story_app/features/story/data/remote/model/stories_response.dart';
import 'package:story_app/features/story/data/remote/model/upload_response.dart';

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
      "location": "0",
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

  Future<UploadResponse> uploadStory(
    List<int> bytes,
    String fileName,
    String description,
  ) async {
    final user = await localDataSource.getUser();
    final token = user?.token;
    final headers = {
      HttpHeaders.contentTypeHeader: "multipart/form-data",
      HttpHeaders.authorizationHeader: "Bearer $token"
    };
    final uri = Uri.https(
      ApiLinks.baseUrl,
      ApiLinks.storyEndpoint,
    );
    var request = MultipartRequest('POST', uri);

    final multiPartFile = MultipartFile.fromBytes(
      "photo",
      bytes,
      filename: fileName,
    );

    final Map<String, String> fields = {
      "description": description,
    };

    request.files.add(multiPartFile);
    request.fields.addAll(fields);
    request.headers.addAll(headers);

    final StreamedResponse streamedResponse = await request.send();
    final int statusCode = streamedResponse.statusCode;

    final Uint8List responseList = await streamedResponse.stream.toBytes();
    final String responseData = String.fromCharCodes(responseList);

    if (statusCode == 201) {
      final UploadResponse uploadResponse =
          UploadResponse.fromJson(responseData);

      return uploadResponse;
    } else {
      throw Exception("Upload file Error");
    }
  }
}
