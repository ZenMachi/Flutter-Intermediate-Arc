import 'dart:io';
import 'package:either_dart/either.dart';
import 'package:story_app/features/authentication/data/auth_repository.dart';
import 'package:story_app/features/story/data/data_source/remote/story_remote_data_source.dart';
import 'package:story_app/features/story/data/model/detail/detail_story_response.dart';
import 'package:story_app/features/story/data/model/stories/stories_response.dart';
import 'package:story_app/utils/exceptions/exceptions.dart';
import 'package:story_app/utils/failures/failure.dart';

class StoryRepository {
  final AuthRepository authRepository;
  final StoryRemoteDataSource remoteDataSource;

  StoryRepository(
      {required this.authRepository, required this.remoteDataSource});

  Future<Either<Failure, StoriesResponse>> getStories() async {
    try {
      final token = await authRepository.getLocalToken();
      final response = await remoteDataSource.getStories(token!);
      if (response.listStory.isEmpty) {
        return Left(Failure("No Stories available"));
      }
      return Right(response);
    } catch (e) {
      if (e is BadRequestException) {
        return Left(Failure(e.message));
      } else if (e is UnauthorizedException) {
        return Left(Failure(e.message));
      } else if (e is SocketException) {
        return Left(Failure("Connection Problem, Please Retry again"));
      } else {
        return Left(Failure(e.toString()));
      }
    }
  }

  Future<Either<Failure, DetailStoryResponse>> getDetailStory(String id) async {
    try {
      final token = await authRepository.getLocalToken();
      final response = await remoteDataSource.getDetailStory(id, token!);
      return Right(response);
    } catch (e) {
      if (e is BadRequestException) {
        return Left(Failure(e.message));
      } else if (e is UnauthorizedException) {
        return Left(Failure(e.message));
      } else if (e is SocketException) {
        return Left(Failure("Connection Problem, Please Retry again"));
      } else {
        return Left(Failure(e.toString()));
      }
    }
  }

  Future<Either<Failure, bool>> uploadStory(
    List<int> source,
    String fileName,
    String description,
  ) async {
    try {
      final token = await authRepository.getLocalToken();
      final response = await remoteDataSource.postUploadStory(
          source, fileName, description, token!);
      if (response.error == false) return const Right(false);
      return Left(Failure(response.message));
    } catch (e) {
      if (e is BadRequestException) {
        return Left(Failure(e.message));
      } else if (e is UnauthorizedException) {
        return Left(Failure(e.message));
      } else if (e is SocketException) {
        return Left(Failure("Connection Problem, Please Retry again"));
      } else {
        return Left(Failure(e.toString()));
      }
    }
  }
}
