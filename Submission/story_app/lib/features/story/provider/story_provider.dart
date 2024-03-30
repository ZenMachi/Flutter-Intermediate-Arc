import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:story_app/features/story/data/model/detail/detail_story_response.dart';
import 'package:story_app/features/story/data/model/stories/stories_response.dart';
import 'package:story_app/features/story/data/model/upload/upload_response.dart';
import 'package:story_app/features/story/data/story_repository.dart';
import 'package:story_app/utils/result_state.dart';

class StoryProvider extends ChangeNotifier {
  final StoryRepository repository;
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

  StoryProvider({required this.repository});

  Future<dynamic> fetchStories() async {
    _state = ResultState.loading;
    notifyListeners();

    final result = await repository.getStories();

    return result.fold((left) {
      _state = ResultState.error;
      notifyListeners();

      _message = left.message;
      log(_message);
      return _message;
    }, (right) {
      _state = ResultState.hasData;
      notifyListeners();
      return _storiesResponse = right;
    });

    // try {
    //   _state = ResultState.loading;
    //   notifyListeners();
    //
    //   final result = await apiService.getStories();
    //
    //   if (result.listStory.isEmpty) {
    //     _state = ResultState.noData;
    //     notifyListeners();
    //
    //     return _message = "There is no data";
    //   } else {
    //     _state = ResultState.hasData;
    //     notifyListeners();
    //
    //     return _storiesResponse = result;
    //   }
    // } catch (e) {
    //   _state = ResultState.error;
    //   log('ErrorFetch --> $e');
    //   notifyListeners();
    //
    //   return _message = "Please Check Your Internet Connection";
    // }
  }

  Future<dynamic> fetchDetailStory(String id) async {
    _state = ResultState.loading;
    notifyListeners();

    final result = await repository.getDetailStory(id);

    return result.fold((left) {
      _state = ResultState.error;
      notifyListeners();

      _message = left.message;
      log(_message);
      return _message;
    }, (right) {
      _state = ResultState.hasData;
      notifyListeners();
      return _detailStoryResponse = right;
    });

    // try {
    //   _state = ResultState.loading;
    //   notifyListeners();
    //
    //   final result = await apiService.getDetailStory(id);
    //
    //   if (result.error == true) {
    //     _state = ResultState.error;
    //     notifyListeners();
    //
    //     return _message = "Error Reason: ${result.message}";
    //   } else {
    //     _state = ResultState.hasData;
    //     notifyListeners();
    //
    //     return _detailStoryResponse = result;
    //   }
    // } catch (e) {
    //   _state = ResultState.error;
    //   log('ErrorFetch --> $e');
    //   notifyListeners();
    //
    //   return _message = "Please Check Your Internet Connection";
    // }
  }

  Future<void> uploadStory(
    List<int> bytes,
    String fileName,
    String description,
  ) async {
    _state = ResultState.loading;
    notifyListeners();

    final result = await repository.uploadStory(bytes, fileName, description);

    return result.fold((left) {
      isLoading = false;
      _state = ResultState.success;
      notifyListeners();

      _message = left.message;
      log(_message);
    }, (right) {
      _state = ResultState.success;
      _message = "Upload Success";
      notifyListeners();
      isLoading = right;
    });

    // try {
    //   _message = "";
    //   _uploadResponse = null;
    //   isLoading = true;
    //   notifyListeners();
    //   final response =  await apiService.postUploadStory(
    //     bytes,
    //     fileName,
    //     description,
    //   );
    //
    //   _uploadResponse = response;
    //   _message = _uploadResponse?.message ?? "success";
    //   log(_message);
    //   isLoading = false;
    //   notifyListeners();
    // } catch (e) {
    //   isLoading = false;
    //   _message = e.toString();
    //   log('Error Post --> $_message');
    //   notifyListeners();
    // }
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
