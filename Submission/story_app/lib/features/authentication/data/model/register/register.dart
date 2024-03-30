import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'register.g.dart';
part 'register.freezed.dart';

@freezed
class RegisterInfo with _$RegisterInfo {

  const factory RegisterInfo({
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "email") required String email,
    @JsonKey(name: "password") required String password,
  }) = _RegisterInfo;

  factory RegisterInfo.fromJson(Map<String, dynamic> json) =>
      _$RegisterInfoFromJson(json);
}
