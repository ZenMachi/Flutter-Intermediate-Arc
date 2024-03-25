import 'package:story_app/features/authentication/data/model/user.dart';

class LoginResponse {
  bool error;
  String message;
  User? loginResult;

  LoginResponse({
    required this.error,
    required this.message,
    this.loginResult,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    error: json["error"],
    message: json["message"],
    loginResult: User.fromJson(json["loginResult"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "loginResult": loginResult?.toJson(),
  };
}


