import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart'
    show Client, MultipartFile, MultipartRequest, StreamedResponse;
import 'package:story_app/common/constants.dart';
import 'package:story_app/features/story/data/model/detail_story_response.dart';
import 'package:story_app/features/story/data/model/stories_response.dart';
import 'package:story_app/features/story/data/model/upload_response.dart';
import 'package:story_app/utils/exceptions/exceptions.dart';

class StoryRemoteDataSource {
  final Client client;

  StoryRemoteDataSource(this.client);

  Future<StoriesResponse> getStories(String token) async {
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
    } else if (response.statusCode == 400) {
      final message = json.decode(response.body);
      throw BadRequestException(message['message']);
    } else if (response.statusCode == 401) {
      final message = json.decode(response.body);
      throw UnauthorizedException(message['message']);
    } else {
      throw Exception('Unhandled Exception');
    }
  }

  Future<DetailStoryResponse> getDetailStory(String id, String token) async {
    final headers = {HttpHeaders.authorizationHeader: "Bearer $token"};
    final uri = Uri.https(
      ApiLinks.baseUrl,
      "${ApiLinks.storyEndpoint}/$id",
    );
    final response = await client.get(uri, headers: headers);

    if (response.statusCode == 200) {
      return DetailStoryResponse.fromJson(json.decode(response.body));
    } else if (response.statusCode == 400) {
      final message = json.decode(response.body);
      throw BadRequestException(message['message']);
    } else if (response.statusCode == 401) {
      final message = json.decode(response.body);
      throw UnauthorizedException(message['message']);
    } else {
      throw Exception('Unhandled Exception');
    }
  }

  Future<UploadResponse> postUploadStory(
    List<int> bytes,
    String fileName,
    String description,
    String token,
  ) async {
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
    } else if (statusCode == 400) {
      final message = UploadResponse.fromJson(responseData);
      throw BadRequestException(message.message);
    } else if (statusCode == 401) {
      final message = UploadResponse.fromJson(responseData);
      throw UnauthorizedException(message.message);
    } else {
      throw Exception("Unhandled Exception");
    }
  }
}
