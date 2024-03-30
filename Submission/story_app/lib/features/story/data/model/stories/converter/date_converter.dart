import 'package:json_annotation/json_annotation.dart';

class Iso8601DateTimeConverter implements JsonConverter<DateTime, String> {
  const Iso8601DateTimeConverter();

  @override
  DateTime fromJson(String json) => DateTime.parse(json);

  @override
  String toJson(DateTime dt) => dt.toIso8601String();
}