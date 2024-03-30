import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.g.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: "userId") required String userId,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "token") required String token,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
