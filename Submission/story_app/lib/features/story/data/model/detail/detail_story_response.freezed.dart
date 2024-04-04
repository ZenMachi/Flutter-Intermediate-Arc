// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_story_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetailStoryResponse _$DetailStoryResponseFromJson(Map<String, dynamic> json) {
  return _DetailStoryResponse.fromJson(json);
}

/// @nodoc
mixin _$DetailStoryResponse {
  @JsonKey(name: "error")
  bool get error => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: "story")
  Story get story => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailStoryResponseCopyWith<DetailStoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailStoryResponseCopyWith<$Res> {
  factory $DetailStoryResponseCopyWith(
          DetailStoryResponse value, $Res Function(DetailStoryResponse) then) =
      _$DetailStoryResponseCopyWithImpl<$Res, DetailStoryResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "error") bool error,
      @JsonKey(name: "message") String message,
      @JsonKey(name: "story") Story story});

  $StoryCopyWith<$Res> get story;
}

/// @nodoc
class _$DetailStoryResponseCopyWithImpl<$Res, $Val extends DetailStoryResponse>
    implements $DetailStoryResponseCopyWith<$Res> {
  _$DetailStoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? message = null,
    Object? story = null,
  }) {
    return _then(_value.copyWith(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      story: null == story
          ? _value.story
          : story // ignore: cast_nullable_to_non_nullable
              as Story,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StoryCopyWith<$Res> get story {
    return $StoryCopyWith<$Res>(_value.story, (value) {
      return _then(_value.copyWith(story: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailStoryResponseImplCopyWith<$Res>
    implements $DetailStoryResponseCopyWith<$Res> {
  factory _$$DetailStoryResponseImplCopyWith(_$DetailStoryResponseImpl value,
          $Res Function(_$DetailStoryResponseImpl) then) =
      __$$DetailStoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "error") bool error,
      @JsonKey(name: "message") String message,
      @JsonKey(name: "story") Story story});

  @override
  $StoryCopyWith<$Res> get story;
}

/// @nodoc
class __$$DetailStoryResponseImplCopyWithImpl<$Res>
    extends _$DetailStoryResponseCopyWithImpl<$Res, _$DetailStoryResponseImpl>
    implements _$$DetailStoryResponseImplCopyWith<$Res> {
  __$$DetailStoryResponseImplCopyWithImpl(_$DetailStoryResponseImpl _value,
      $Res Function(_$DetailStoryResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? message = null,
    Object? story = null,
  }) {
    return _then(_$DetailStoryResponseImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      story: null == story
          ? _value.story
          : story // ignore: cast_nullable_to_non_nullable
              as Story,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailStoryResponseImpl implements _DetailStoryResponse {
  const _$DetailStoryResponseImpl(
      {@JsonKey(name: "error") required this.error,
      @JsonKey(name: "message") required this.message,
      @JsonKey(name: "story") required this.story});

  factory _$DetailStoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailStoryResponseImplFromJson(json);

  @override
  @JsonKey(name: "error")
  final bool error;
  @override
  @JsonKey(name: "message")
  final String message;
  @override
  @JsonKey(name: "story")
  final Story story;

  @override
  String toString() {
    return 'DetailStoryResponse(error: $error, message: $message, story: $story)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailStoryResponseImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.story, story) || other.story == story));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, error, message, story);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailStoryResponseImplCopyWith<_$DetailStoryResponseImpl> get copyWith =>
      __$$DetailStoryResponseImplCopyWithImpl<_$DetailStoryResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailStoryResponseImplToJson(
      this,
    );
  }
}

abstract class _DetailStoryResponse implements DetailStoryResponse {
  const factory _DetailStoryResponse(
          {@JsonKey(name: "error") required final bool error,
          @JsonKey(name: "message") required final String message,
          @JsonKey(name: "story") required final Story story}) =
      _$DetailStoryResponseImpl;

  factory _DetailStoryResponse.fromJson(Map<String, dynamic> json) =
      _$DetailStoryResponseImpl.fromJson;

  @override
  @JsonKey(name: "error")
  bool get error;
  @override
  @JsonKey(name: "message")
  String get message;
  @override
  @JsonKey(name: "story")
  Story get story;
  @override
  @JsonKey(ignore: true)
  _$$DetailStoryResponseImplCopyWith<_$DetailStoryResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
