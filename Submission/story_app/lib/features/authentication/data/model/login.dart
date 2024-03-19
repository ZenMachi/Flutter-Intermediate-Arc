import 'dart:convert';

class LoginInfo {
  String email;
  String password;

  LoginInfo({
    required this.email,
    required this.password,
  });

  factory LoginInfo.fromJson(Map<String, dynamic> json) => LoginInfo(
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };

  factory LoginInfo.fromJsonString(String source) => LoginInfo.fromJson(json.decode(source));

  String toJsonString() => json.encode(toJson());
}