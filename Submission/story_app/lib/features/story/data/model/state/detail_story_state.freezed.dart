// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_story_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DetailStoryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Story data) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Story data)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Story data)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DetailStoryStateInitial value) initial,
    required TResult Function(DetailStoryStateLoading value) loading,
    required TResult Function(DetailStoryStateLoaded value) loaded,
    required TResult Function(DetailStoryStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DetailStoryStateInitial value)? initial,
    TResult? Function(DetailStoryStateLoading value)? loading,
    TResult? Function(DetailStoryStateLoaded value)? loaded,
    TResult? Function(DetailStoryStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DetailStoryStateInitial value)? initial,
    TResult Function(DetailStoryStateLoading value)? loading,
    TResult Function(DetailStoryStateLoaded value)? loaded,
    TResult Function(DetailStoryStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailStoryStateCopyWith<$Res> {
  factory $DetailStoryStateCopyWith(
          DetailStoryState value, $Res Function(DetailStoryState) then) =
      _$DetailStoryStateCopyWithImpl<$Res, DetailStoryState>;
}

/// @nodoc
class _$DetailStoryStateCopyWithImpl<$Res, $Val extends DetailStoryState>
    implements $DetailStoryStateCopyWith<$Res> {
  _$DetailStoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DetailStoryStateInitialImplCopyWith<$Res> {
  factory _$$DetailStoryStateInitialImplCopyWith(
          _$DetailStoryStateInitialImpl value,
          $Res Function(_$DetailStoryStateInitialImpl) then) =
      __$$DetailStoryStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DetailStoryStateInitialImplCopyWithImpl<$Res>
    extends _$DetailStoryStateCopyWithImpl<$Res, _$DetailStoryStateInitialImpl>
    implements _$$DetailStoryStateInitialImplCopyWith<$Res> {
  __$$DetailStoryStateInitialImplCopyWithImpl(
      _$DetailStoryStateInitialImpl _value,
      $Res Function(_$DetailStoryStateInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DetailStoryStateInitialImpl implements DetailStoryStateInitial {
  const _$DetailStoryStateInitialImpl();

  @override
  String toString() {
    return 'DetailStoryState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailStoryStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Story data) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Story data)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Story data)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DetailStoryStateInitial value) initial,
    required TResult Function(DetailStoryStateLoading value) loading,
    required TResult Function(DetailStoryStateLoaded value) loaded,
    required TResult Function(DetailStoryStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DetailStoryStateInitial value)? initial,
    TResult? Function(DetailStoryStateLoading value)? loading,
    TResult? Function(DetailStoryStateLoaded value)? loaded,
    TResult? Function(DetailStoryStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DetailStoryStateInitial value)? initial,
    TResult Function(DetailStoryStateLoading value)? loading,
    TResult Function(DetailStoryStateLoaded value)? loaded,
    TResult Function(DetailStoryStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class DetailStoryStateInitial implements DetailStoryState {
  const factory DetailStoryStateInitial() = _$DetailStoryStateInitialImpl;
}

/// @nodoc
abstract class _$$DetailStoryStateLoadingImplCopyWith<$Res> {
  factory _$$DetailStoryStateLoadingImplCopyWith(
          _$DetailStoryStateLoadingImpl value,
          $Res Function(_$DetailStoryStateLoadingImpl) then) =
      __$$DetailStoryStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DetailStoryStateLoadingImplCopyWithImpl<$Res>
    extends _$DetailStoryStateCopyWithImpl<$Res, _$DetailStoryStateLoadingImpl>
    implements _$$DetailStoryStateLoadingImplCopyWith<$Res> {
  __$$DetailStoryStateLoadingImplCopyWithImpl(
      _$DetailStoryStateLoadingImpl _value,
      $Res Function(_$DetailStoryStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DetailStoryStateLoadingImpl implements DetailStoryStateLoading {
  const _$DetailStoryStateLoadingImpl();

  @override
  String toString() {
    return 'DetailStoryState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailStoryStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Story data) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Story data)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Story data)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DetailStoryStateInitial value) initial,
    required TResult Function(DetailStoryStateLoading value) loading,
    required TResult Function(DetailStoryStateLoaded value) loaded,
    required TResult Function(DetailStoryStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DetailStoryStateInitial value)? initial,
    TResult? Function(DetailStoryStateLoading value)? loading,
    TResult? Function(DetailStoryStateLoaded value)? loaded,
    TResult? Function(DetailStoryStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DetailStoryStateInitial value)? initial,
    TResult Function(DetailStoryStateLoading value)? loading,
    TResult Function(DetailStoryStateLoaded value)? loaded,
    TResult Function(DetailStoryStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class DetailStoryStateLoading implements DetailStoryState {
  const factory DetailStoryStateLoading() = _$DetailStoryStateLoadingImpl;
}

/// @nodoc
abstract class _$$DetailStoryStateLoadedImplCopyWith<$Res> {
  factory _$$DetailStoryStateLoadedImplCopyWith(
          _$DetailStoryStateLoadedImpl value,
          $Res Function(_$DetailStoryStateLoadedImpl) then) =
      __$$DetailStoryStateLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Story data});

  $StoryCopyWith<$Res> get data;
}

/// @nodoc
class __$$DetailStoryStateLoadedImplCopyWithImpl<$Res>
    extends _$DetailStoryStateCopyWithImpl<$Res, _$DetailStoryStateLoadedImpl>
    implements _$$DetailStoryStateLoadedImplCopyWith<$Res> {
  __$$DetailStoryStateLoadedImplCopyWithImpl(
      _$DetailStoryStateLoadedImpl _value,
      $Res Function(_$DetailStoryStateLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$DetailStoryStateLoadedImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Story,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $StoryCopyWith<$Res> get data {
    return $StoryCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc

class _$DetailStoryStateLoadedImpl implements DetailStoryStateLoaded {
  const _$DetailStoryStateLoadedImpl(this.data);

  @override
  final Story data;

  @override
  String toString() {
    return 'DetailStoryState.loaded(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailStoryStateLoadedImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailStoryStateLoadedImplCopyWith<_$DetailStoryStateLoadedImpl>
      get copyWith => __$$DetailStoryStateLoadedImplCopyWithImpl<
          _$DetailStoryStateLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Story data) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Story data)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Story data)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DetailStoryStateInitial value) initial,
    required TResult Function(DetailStoryStateLoading value) loading,
    required TResult Function(DetailStoryStateLoaded value) loaded,
    required TResult Function(DetailStoryStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DetailStoryStateInitial value)? initial,
    TResult? Function(DetailStoryStateLoading value)? loading,
    TResult? Function(DetailStoryStateLoaded value)? loaded,
    TResult? Function(DetailStoryStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DetailStoryStateInitial value)? initial,
    TResult Function(DetailStoryStateLoading value)? loading,
    TResult Function(DetailStoryStateLoaded value)? loaded,
    TResult Function(DetailStoryStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class DetailStoryStateLoaded implements DetailStoryState {
  const factory DetailStoryStateLoaded(final Story data) =
      _$DetailStoryStateLoadedImpl;

  Story get data;
  @JsonKey(ignore: true)
  _$$DetailStoryStateLoadedImplCopyWith<_$DetailStoryStateLoadedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DetailStoryStateErrorImplCopyWith<$Res> {
  factory _$$DetailStoryStateErrorImplCopyWith(
          _$DetailStoryStateErrorImpl value,
          $Res Function(_$DetailStoryStateErrorImpl) then) =
      __$$DetailStoryStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$DetailStoryStateErrorImplCopyWithImpl<$Res>
    extends _$DetailStoryStateCopyWithImpl<$Res, _$DetailStoryStateErrorImpl>
    implements _$$DetailStoryStateErrorImplCopyWith<$Res> {
  __$$DetailStoryStateErrorImplCopyWithImpl(_$DetailStoryStateErrorImpl _value,
      $Res Function(_$DetailStoryStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$DetailStoryStateErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DetailStoryStateErrorImpl implements DetailStoryStateError {
  const _$DetailStoryStateErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'DetailStoryState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailStoryStateErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailStoryStateErrorImplCopyWith<_$DetailStoryStateErrorImpl>
      get copyWith => __$$DetailStoryStateErrorImplCopyWithImpl<
          _$DetailStoryStateErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Story data) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Story data)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Story data)? loaded,
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
    required TResult Function(DetailStoryStateInitial value) initial,
    required TResult Function(DetailStoryStateLoading value) loading,
    required TResult Function(DetailStoryStateLoaded value) loaded,
    required TResult Function(DetailStoryStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DetailStoryStateInitial value)? initial,
    TResult? Function(DetailStoryStateLoading value)? loading,
    TResult? Function(DetailStoryStateLoaded value)? loaded,
    TResult? Function(DetailStoryStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DetailStoryStateInitial value)? initial,
    TResult Function(DetailStoryStateLoading value)? loading,
    TResult Function(DetailStoryStateLoaded value)? loaded,
    TResult Function(DetailStoryStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class DetailStoryStateError implements DetailStoryState {
  const factory DetailStoryStateError(final String message) =
      _$DetailStoryStateErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$DetailStoryStateErrorImplCopyWith<_$DetailStoryStateErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
