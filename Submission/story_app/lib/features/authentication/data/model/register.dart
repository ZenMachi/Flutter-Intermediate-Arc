import 'dart:convert';

class RegisterInfo {
  String name;
  String email;
  String password;

  RegisterInfo({
    required this.name,
    required this.email,
    required this.password,
  });

  factory RegisterInfo.fromJson(Map<String, dynamic> json) => RegisterInfo(
        name: json["name"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
      };

  factory RegisterInfo.fromJsonString(String source) =>
      RegisterInfo.fromJson(json.decode(source));

  String toJsonString() => json.encode(toJson());
}
