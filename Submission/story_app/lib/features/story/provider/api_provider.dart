import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:story_app/features/story/data/model/detail_story_response.dart';
import 'package:story_app/features/story/data/model/stories_response.dart';
import 'package:story_app/features/story/data/remote/remote_data_source.dart';
import 'package:story_app/utils/result_state.dart';

class ApiProvider extends ChangeNotifier {
  final RemoteDataSource apiService;
  late ResultState _state;

  ResultState get state => _state;
  String _message = '';

  String get message => _message;
  late StoriesResponse _storiesResponse;

  StoriesResponse get storiesResult => _storiesResponse;
  late DetailStoryResponse _detailStoryResponse;

  DetailStoryResponse get storyDetailResult => _detailStoryResponse;

  ApiProvider({required this.apiService});

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
}
