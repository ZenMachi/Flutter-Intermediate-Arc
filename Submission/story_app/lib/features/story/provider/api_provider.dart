import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:story_app/features/story/data/api/api_service.dart';
import 'package:story_app/features/story/data/model/stories_response.dart';
import 'package:story_app/utils/result_state.dart';

class ApiProvider extends ChangeNotifier {
  final ApiService apiService;

  ApiProvider({required this.apiService});

  late ResultState _state;

  ResultState get state => _state;

  String _message = '';

  String get message => _message;

  late StoriesResponse _storiesResponse;

  StoriesResponse get storiesResult => _storiesResponse;

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
}
