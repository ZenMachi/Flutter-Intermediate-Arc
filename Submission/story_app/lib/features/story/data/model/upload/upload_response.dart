import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_response.g.dart';
part 'upload_response.freezed.dart';

@freezed
class UploadResponse with _$UploadResponse {
  const factory UploadResponse({
    @JsonKey(name: "error") required bool error,
    @JsonKey(name: "message") required String message,
  }) = _UploadResponse;

  factory UploadResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadResponseFromJson(json);

  factory UploadResponse.fromJsonString(String source) =>
      UploadResponse.fromJson(json.decode(source));
}
