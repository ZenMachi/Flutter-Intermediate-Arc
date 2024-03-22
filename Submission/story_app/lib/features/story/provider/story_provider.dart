import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:story_app/features/story/data/remote/model/detail_story_response.dart';
import 'package:story_app/features/story/data/remote/model/stories_response.dart';
import 'package:story_app/features/story/data/remote/model/upload_response.dart';
import 'package:story_app/features/story/data/remote/story_remote_data_source.dart';
import 'package:story_app/utils/result_state.dart';

class StoryProvider extends ChangeNotifier {
  final StoryRemoteDataSource apiService;
  late ResultState _state;
  String _message = '';
  String? imagePath;
  XFile? imageFile;
  bool isLoading = false;
  late StoriesResponse _storiesResponse;
  late DetailStoryResponse _detailStoryResponse;
  late UploadResponse? _uploadResponse;

  ResultState get state => _state;

  String get message => _message;

  StoriesResponse get storiesResult => _storiesResponse;

  DetailStoryResponse get storyDetailResult => _detailStoryResponse;

  UploadResponse? get uploadResult => _uploadResponse;

  StoryProvider({required this.apiService});

  Future<dynamic> fetchStories() async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      final result = await apiService.getStories();

      if (result.listStory.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();

        return _message = "There is no data";
      } else {
        _state = ResultState.hasData;
        notifyListeners();

        return _storiesResponse = result;
      }
    } catch (e) {
      _state = ResultState.error;
      log('ErrorFetch --> $e');
      notifyListeners();

      return _message = "Please Check Your Internet Connection";
    }
  }

  Future<dynamic> fetchDetailStory(String id) async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      final result = await apiService.getDetailStory(id);

      if (result.error == true) {
        _state = ResultState.error;
        notifyListeners();

        return _message = "Error Reason: ${result.message}";
      } else {
        _state = ResultState.hasData;
        notifyListeners();

        return _detailStoryResponse = result;
      }
    } catch (e) {
      _state = ResultState.error;
      log('ErrorFetch --> $e');
      notifyListeners();

      return _message = "Please Check Your Internet Connection";
    }
  }

  Future<void> uploadStory(
    List<int> bytes,
    String fileName,
    String description,
  ) async {
    try {
      _message = "";
      _uploadResponse = null;
      isLoading = true;
      notifyListeners();
      final response =  await apiService.uploadStory(
        bytes,
        fileName,
        description,
      );

      _uploadResponse = response;
      _message = _uploadResponse?.message ?? "success";
      log(_message);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      _message = e.toString();
      log('Error Post --> $_message');
      notifyListeners();
    }
  }

  Future<List<int>> compressImage(List<int> bytes) async {
    int imageLength = bytes.length;
    if (imageLength < 1000000) return bytes;

    final img.Image image = img.decodeImage(Uint8List.fromList(bytes))!;
    int compressQuality = 100;
    int length = imageLength;
    List<int> newByte = [];

    do {
      compressQuality -= 10;

      newByte = img.encodeJpg(
        image,
        quality: compressQuality,
      );

      length = newByte.length;
    } while (length > 1000000);
    return newByte;
  }

  void setImagePath(String? path) {
    imagePath = path;
    notifyListeners();
  }

  void setImageFile(XFile? file) {
    imageFile = file;
    notifyListeners();
  }
}
