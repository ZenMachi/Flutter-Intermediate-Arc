// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UploadState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) loading,
    required TResult Function(String response) success,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading)? loading,
    TResult? Function(String response)? success,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? loading,
    TResult Function(String response)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UploadStateLoading value) loading,
    required TResult Function(UploadStateSuccess value) success,
    required TResult Function(UploadStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UploadStateLoading value)? loading,
    TResult? Function(UploadStateSuccess value)? success,
    TResult? Function(UploadStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UploadStateLoading value)? loading,
    TResult Function(UploadStateSuccess value)? success,
    TResult Function(UploadStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadStateCopyWith<$Res> {
  factory $UploadStateCopyWith(
          UploadState value, $Res Function(UploadState) then) =
      _$UploadStateCopyWithImpl<$Res, UploadState>;
}

/// @nodoc
class _$UploadStateCopyWithImpl<$Res, $Val extends UploadState>
    implements $UploadStateCopyWith<$Res> {
  _$UploadStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UploadStateLoadingImplCopyWith<$Res> {
  factory _$$UploadStateLoadingImplCopyWith(_$UploadStateLoadingImpl value,
          $Res Function(_$UploadStateLoadingImpl) then) =
      __$$UploadStateLoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$UploadStateLoadingImplCopyWithImpl<$Res>
    extends _$UploadStateCopyWithImpl<$Res, _$UploadStateLoadingImpl>
    implements _$$UploadStateLoadingImplCopyWith<$Res> {
  __$$UploadStateLoadingImplCopyWithImpl(_$UploadStateLoadingImpl _value,
      $Res Function(_$UploadStateLoadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$UploadStateLoadingImpl(
      null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UploadStateLoadingImpl implements UploadStateLoading {
  const _$UploadStateLoadingImpl(this.isLoading);

  @override
  final bool isLoading;

  @override
  String toString() {
    return 'UploadState.loading(isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadStateLoadingImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadStateLoadingImplCopyWith<_$UploadStateLoadingImpl> get copyWith =>
      __$$UploadStateLoadingImplCopyWithImpl<_$UploadStateLoadingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) loading,
    required TResult Function(String response) success,
    required TResult Function(String message) error,
  }) {
    return loading(isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading)? loading,
    TResult? Function(String response)? success,
    TResult? Function(String message)? error,
  }) {
    return loading?.call(isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? loading,
    TResult Function(String response)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UploadStateLoading value) loading,
    required TResult Function(UploadStateSuccess value) success,
    required TResult Function(UploadStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UploadStateLoading value)? loading,
    TResult? Function(UploadStateSuccess value)? success,
    TResult? Function(UploadStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UploadStateLoading value)? loading,
    TResult Function(UploadStateSuccess value)? success,
    TResult Function(UploadStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class UploadStateLoading implements UploadState {
  const factory UploadStateLoading(final bool isLoading) =
      _$UploadStateLoadingImpl;

  bool get isLoading;
  @JsonKey(ignore: true)
  _$$UploadStateLoadingImplCopyWith<_$UploadStateLoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UploadStateSuccessImplCopyWith<$Res> {
  factory _$$UploadStateSuccessImplCopyWith(_$UploadStateSuccessImpl value,
          $Res Function(_$UploadStateSuccessImpl) then) =
      __$$UploadStateSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String response});
}

/// @nodoc
class __$$UploadStateSuccessImplCopyWithImpl<$Res>
    extends _$UploadStateCopyWithImpl<$Res, _$UploadStateSuccessImpl>
    implements _$$UploadStateSuccessImplCopyWith<$Res> {
  __$$UploadStateSuccessImplCopyWithImpl(_$UploadStateSuccessImpl _value,
      $Res Function(_$UploadStateSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$UploadStateSuccessImpl(
      null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UploadStateSuccessImpl implements UploadStateSuccess {
  const _$UploadStateSuccessImpl(this.response);

  @override
  final String response;

  @override
  String toString() {
    return 'UploadState.success(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadStateSuccessImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadStateSuccessImplCopyWith<_$UploadStateSuccessImpl> get copyWith =>
      __$$UploadStateSuccessImplCopyWithImpl<_$UploadStateSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) loading,
    required TResult Function(String response) success,
    required TResult Function(String message) error,
  }) {
    return success(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading)? loading,
    TResult? Function(String response)? success,
    TResult? Function(String message)? error,
  }) {
    return success?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? loading,
    TResult Function(String response)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UploadStateLoading value) loading,
    required TResult Function(UploadStateSuccess value) success,
    required TResult Function(UploadStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UploadStateLoading value)? loading,
    TResult? Function(UploadStateSuccess value)? success,
    TResult? Function(UploadStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UploadStateLoading value)? loading,
    TResult Function(UploadStateSuccess value)? success,
    TResult Function(UploadStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class UploadStateSuccess implements UploadState {
  const factory UploadStateSuccess(final String response) =
      _$UploadStateSuccessImpl;

  String get response;
  @JsonKey(ignore: true)
  _$$UploadStateSuccessImplCopyWith<_$UploadStateSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UploadStateErrorImplCopyWith<$Res> {
  factory _$$UploadStateErrorImplCopyWith(_$UploadStateErrorImpl value,
          $Res Function(_$UploadStateErrorImpl) then) =
      __$$UploadStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UploadStateErrorImplCopyWithImpl<$Res>
    extends _$UploadStateCopyWithImpl<$Res, _$UploadStateErrorImpl>
    implements _$$UploadStateErrorImplCopyWith<$Res> {
  __$$UploadStateErrorImplCopyWithImpl(_$UploadStateErrorImpl _value,
      $Res Function(_$UploadStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UploadStateErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UploadStateErrorImpl implements UploadStateError {
  const _$UploadStateErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'UploadState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadStateErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadStateErrorImplCopyWith<_$UploadStateErrorImpl> get copyWith =>
      __$$UploadStateErrorImplCopyWithImpl<_$UploadStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) loading,
    required TResult Function(String response) success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading)? loading,
    TResult? Function(String response)? success,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? loading,
    TResult Function(String response)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UploadStateLoading value) loading,
    required TResult Function(UploadStateSuccess value) success,
    required TResult Function(UploadStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UploadStateLoading value)? loading,
    TResult? Function(UploadStateSuccess value)? success,
    TResult? Function(UploadStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UploadStateLoading value)? loading,
    TResult Function(UploadStateSuccess value)? success,
    TResult Function(UploadStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class UploadStateError implements UploadState {
  const factory UploadStateError(final String message) = _$UploadStateErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$UploadStateErrorImplCopyWith<_$UploadStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
