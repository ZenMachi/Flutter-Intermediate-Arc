import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_form.g.dart';
part 'login_form.freezed.dart';

@freezed
class LoginForm with _$LoginForm {
  const factory LoginForm({
    @JsonKey(name: "email") required String email,
    @JsonKey(name: "password") required String password,
  }) = _LoginForm;

  factory LoginForm.fromJson(Map<String, dynamic> json) =>
      _$LoginFormFromJson(json);
}
