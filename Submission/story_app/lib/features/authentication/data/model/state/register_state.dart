import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@Freezed(equal: false)
class RegisterState with _$RegisterState {
  const factory RegisterState.loading(bool isLoading) = RegisterStateLoading;
  const factory RegisterState.success() = RegisterStateSuccess;
  const factory RegisterState.error(String message) = RegisterStateError;
}