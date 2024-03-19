import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:story_app/features/authentication/data/local/auth_local_data_source.dart';
import 'package:story_app/features/authentication/data/model/login.dart';
import 'package:story_app/features/authentication/data/model/login_response.dart';
import 'package:story_app/features/authentication/data/model/register.dart';
import 'package:story_app/features/authentication/data/model/register_response.dart';
import 'package:story_app/features/authentication/data/remote/auth_remote_data_source.dart';
import 'package:story_app/utils/result_state.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRemoteDataSource apiService;
  final AuthLocalDataSource localDataSource;

  String _message = '';
  late ResultState _state;
  late LoginResponse _loginResponse;
  late RegisterResponse _registerResponse;
  bool isLoading = false;
  bool isSuccess = false;

  AuthProvider({required this.apiService, required this.localDataSource});

  String get message => _message;

  ResultState get state => _state;

  LoginResponse get loginResult => _loginResponse;
  RegisterResponse get registerResponse => _registerResponse;


  Future<bool> loginUser(LoginInfo loginInfo) async {
    try {
      _state = ResultState.loading;
      isLoading = true;
      notifyListeners();

      final result = await apiService.postLoginInfo(loginInfo);

      if (result.error == true) {
        _state = ResultState.error;
        isLoading = false;
        notifyListeners();
        _message = "Error Reason: ${result.message}";
        log(_message);
        isSuccess = false;

        return isSuccess;
      } else {
        _state = ResultState.hasData;
        notifyListeners();

        await localDataSource.saveUser(result.loginResult);
        log('UserName: ${result.loginResult.name}');
        await localDataSource.login();

        isSuccess = await localDataSource.isLoggedIn();
        isLoading = false;
        notifyListeners();

        return isSuccess;
      }
    } catch (e) {
      _state = ResultState.error;
      isLoading = false;
      notifyListeners();
      _message = e.toString();
      log('ErrorFetch ---> $_message');
      isSuccess = false;
      notifyListeners();

      return isSuccess;
    }
  }

  Future<bool> registerUser(RegisterInfo registerInfo) async {
    try {
      _state = ResultState.loading;
      isLoading = true;
      notifyListeners();

      final result = await apiService.postRegisterInfo(registerInfo);

      if (result.error == true) {
        _state = ResultState.error;
        isLoading = false;
        notifyListeners();
        _message = "Error Reason: ${result.message}";
        log(_message);
        isSuccess = false;

        return isSuccess;
      } else {
        _state = ResultState.hasData;
        isLoading = false;
        notifyListeners();

        _registerResponse = result;
        log('Result: ${result.message.toString()}');
        isSuccess = true;

        return isSuccess;
      }
    } catch (e) {
      _state = ResultState.error;
      isLoading = false;
      notifyListeners();

      log('ErrorFetch --> $e');
      _message = e.toString();
      isSuccess = false;

      return isSuccess;
    }
  }
}
