import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:story_app/features/story/data/model/state/detail_story_state.dart';
import 'package:story_app/features/story/data/model/state/stories_state.dart';
import 'package:story_app/features/story/data/model/state/upload_state.dart';
import 'package:story_app/features/story/data/model/stories/story.dart';
import 'package:story_app/features/story/data/story_repository.dart';
import 'package:geocoding/geocoding.dart' as geo;

class StoryProvider extends ChangeNotifier {
  final StoryRepository repository;
  String? imagePath;
  XFile? imageFile;
  LatLng? latLng;
  late List<LatLng> listLatLng;
  String? locationName;
  int? pageItems = 1;
  int sizeItems = 5;
  late List<Story> _listStory;
  StoriesState storiesState = const StoriesState.initial();
  DetailStoryState detailStoryState = const DetailStoryState.initial();
  UploadState uploadState = const UploadState.loading(false);

  StoryProvider({required this.repository});

  Future<void> fetchStories(bool refresh) async {
    if (refresh == true) {
      pageItems = 1;
      _listStory.clear();
      notifyListeners();
    }
    if (pageItems == 1) {
      _listStory = List<Story>.empty(growable: true);
      listLatLng = List<LatLng>.empty(growable: true);
      storiesState = const StoriesState.loading();
      notifyListeners();
    }

    final result = await repository.getStories(pageItems!, sizeItems);

    return result.fold((left) {
      storiesState = StoriesState.error(left.message);
      notifyListeners();
      log(left.message);
    }, (right) {
      log(pageItems.toString());

      _listStory.addAll(right.listStory);
      storiesState = StoriesState.loaded(_listStory);
      for (final data in _listStory) {
        if (data.lon != null && data.lat != null) {
          final location = LatLng(data.lat!, data.lon!);
          log(location.toString());
          listLatLng.add(location);
        }
      }
      notifyListeners();

      log(_listStory.length.toString());

      if (result.right.listStory.length < sizeItems) {
        pageItems = null;
      } else {
        pageItems = pageItems! + 1;
      }
      notifyListeners();
    });
  }

  Future<dynamic> fetchDetailStory(String id) async {
    detailStoryState = const DetailStoryState.loading();
    notifyListeners();

    final result = await repository.getDetailStory(id);

    return result.fold((left) {
      detailStoryState = DetailStoryState.error(left.message);
      notifyListeners();
      log(left.message);
    }, (right) {
      detailStoryState = DetailStoryState.loaded(right.story);
      notifyListeners();
    });
  }

  Future<void> uploadStory(
    List<int> bytes,
    String fileName,
    String description,
  ) async {
    uploadState = const UploadState.loading(true);
    notifyListeners();

    final result = await repository.uploadStory(
      bytes,
      fileName,
      description,
      latLng?.latitude,
      latLng?.longitude,
    );

    return result.fold((left) {
      uploadState = const UploadState.loading(false);
      notifyListeners();
      log(left.message);
      uploadState = UploadState.error(left.message);
      notifyListeners();
    }, (right) {
      uploadState = const UploadState.loading(false);
      notifyListeners();
      uploadState = const UploadState.success("Upload Success");
      notifyListeners();
    });
  }

  void setLocationName() async {
    final info =
        await geo.placemarkFromCoordinates(latLng!.latitude, latLng!.longitude);

    final place = info[0];
    final address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    locationName = address;
  }

  void setLatLng(LatLng? location) {
    latLng = location;
    notifyListeners();
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
