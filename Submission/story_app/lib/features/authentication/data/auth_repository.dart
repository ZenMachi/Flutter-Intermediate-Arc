import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:story_app/features/authentication/data/data_source/local/auth_local_data_source.dart';
import 'package:story_app/features/authentication/data/data_source/remote/auth_remote_data_source.dart';
import 'package:story_app/features/authentication/data/model/login/login_form.dart';
import 'package:story_app/features/authentication/data/model/register/register.dart';
import 'package:story_app/utils/exceptions/exceptions.dart';
import 'package:story_app/utils/failures/failure.dart';

class AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepository(
      {required this.remoteDataSource, required this.localDataSource});

  Future<Either<Failure, bool>> loginUser(LoginForm user) async {
    try {
      final result = await remoteDataSource.postLoginInfo(user);
      if (result.error == false) {
        await localDataSource.saveUser(result.loginResult);
        await localDataSource.login();
      }

      final value = await localDataSource.isLoggedIn();
      return Right(value);
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

  Future<Either<Failure, bool>> registerUser(RegisterInfo credentials) async {
    try {
      final result = await remoteDataSource.postRegisterInfo(credentials);

      final value = result.error;
      return Right(value);
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

  Future<bool> checkLogin() async {
    final isLoggedIn = await localDataSource.isLoggedIn();
    final user = await localDataSource.getUser();
    final hasToken = user?.token != null;

    if (isLoggedIn && hasToken) return true;
    return false;
  }

  Future<String?> getLocalToken() async {
    final user = await localDataSource.getUser();
    return user?.token;
  }
}
