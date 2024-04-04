import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:story_app/features/authentication/data/auth_repository.dart';
import 'package:story_app/features/authentication/data/model/login/login_form.dart';
import 'package:story_app/features/authentication/data/model/login/login_response.dart';
import 'package:story_app/features/authentication/data/model/register/register.dart';
import 'package:story_app/features/authentication/data/model/register/register_response.dart';
import 'package:story_app/utils/result_state.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepository repository;

  String _message = '';
  late ResultState _state;
  late LoginResponse _loginResponse;
  late RegisterResponse _registerResponse;
  bool isLoading = false;
  bool isSuccess = false;

  AuthProvider({required this.repository});

  String get message => _message;

  ResultState get state => _state;

  LoginResponse get loginResult => _loginResponse;

  RegisterResponse get registerResponse => _registerResponse;

  Future<bool> loginUser(LoginForm loginInfo) async {
    _state = ResultState.loading;
    isLoading = true;
    notifyListeners();

    final result = await repository.loginUser(loginInfo);

    return result.fold((left) {
      _state = ResultState.error;
      isLoading = false;

      notifyListeners();

      log(left.message);
      _message = left.message;
      return isSuccess = false;
    }, (right) {
      _state = ResultState.hasData;
      isLoading = false;

      notifyListeners();
      log(right.toString());

      return isSuccess = right;
    });
  }

  Future<bool> registerUser(RegisterInfo credentials) async {
    _state = ResultState.loading;
    isLoading = true;
    notifyListeners();

    final result = await repository.registerUser(credentials);

    return result.fold((left) {
      _state = ResultState.error;
      isLoading = false;

      notifyListeners();

      log(left.message);
      _message = left.message;
      return isSuccess = false;
    }, (right) {
      _state = ResultState.hasData;
      isLoading = false;
      _message = "User Created Successfully";

      notifyListeners();
      log(right.toString());

      return isSuccess = right;
    });
  }
}
