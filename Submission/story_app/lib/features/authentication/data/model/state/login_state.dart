import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@Freezed(equal: false)
class LoginState with _$LoginState {
  const factory LoginState.loading(bool isLoading) = LoginStateLoading;
  const factory LoginState.success() = LoginStateSuccess;
  const factory LoginState.error(String message) = LoginStateError;
}