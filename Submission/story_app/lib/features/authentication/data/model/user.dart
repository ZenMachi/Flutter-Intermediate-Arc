import 'dart:convert';

class User {
  String userId;
  String name;
  String token;

  User({
    required this.userId,
    required this.name,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json["userId"],
    name: json["name"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "name": name,
    "token": token,
  };

  factory User.fromJsonString(String source) => User.fromJson(json.decode(source));

  String toJsonString() => json.encode(toJson());
}