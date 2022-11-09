// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_page_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomePageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_homePageStarted value) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_homePageStarted value)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_homePageStarted value)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageEventCopyWith<$Res> {
  factory $HomePageEventCopyWith(
          HomePageEvent value, $Res Function(HomePageEvent) then) =
      _$HomePageEventCopyWithImpl<$Res, HomePageEvent>;
}

/// @nodoc
class _$HomePageEventCopyWithImpl<$Res, $Val extends HomePageEvent>
    implements $HomePageEventCopyWith<$Res> {
  _$HomePageEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_homePageStartedCopyWith<$Res> {
  factory _$$_homePageStartedCopyWith(
          _$_homePageStarted value, $Res Function(_$_homePageStarted) then) =
      __$$_homePageStartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_homePageStartedCopyWithImpl<$Res>
    extends _$HomePageEventCopyWithImpl<$Res, _$_homePageStarted>
    implements _$$_homePageStartedCopyWith<$Res> {
  __$$_homePageStartedCopyWithImpl(
      _$_homePageStarted _value, $Res Function(_$_homePageStarted) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_homePageStarted implements _homePageStarted {
  const _$_homePageStarted();

  @override
  String toString() {
    return 'HomePageEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_homePageStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_homePageStarted value) started,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_homePageStarted value)? started,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_homePageStarted value)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _homePageStarted implements HomePageEvent {
  const factory _homePageStarted() = _$_homePageStarted;
}

/// @nodoc
mixin _$HomePageState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserProfile currentUser) loaded,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserProfile currentUser)? loaded,
    TResult? Function(String? message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserProfile currentUser)? loaded,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_homePageInitial value) initial,
    required TResult Function(_homePageLoading value) loading,
    required TResult Function(_homePageLoaded value) loaded,
    required TResult Function(_homePageError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_homePageInitial value)? initial,
    TResult? Function(_homePageLoading value)? loading,
    TResult? Function(_homePageLoaded value)? loaded,
    TResult? Function(_homePageError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_homePageInitial value)? initial,
    TResult Function(_homePageLoading value)? loading,
    TResult Function(_homePageLoaded value)? loaded,
    TResult Function(_homePageError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageStateCopyWith<$Res> {
  factory $HomePageStateCopyWith(
          HomePageState value, $Res Function(HomePageState) then) =
      _$HomePageStateCopyWithImpl<$Res, HomePageState>;
}

/// @nodoc
class _$HomePageStateCopyWithImpl<$Res, $Val extends HomePageState>
    implements $HomePageStateCopyWith<$Res> {
  _$HomePageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_homePageInitialCopyWith<$Res> {
  factory _$$_homePageInitialCopyWith(
          _$_homePageInitial value, $Res Function(_$_homePageInitial) then) =
      __$$_homePageInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_homePageInitialCopyWithImpl<$Res>
    extends _$HomePageStateCopyWithImpl<$Res, _$_homePageInitial>
    implements _$$_homePageInitialCopyWith<$Res> {
  __$$_homePageInitialCopyWithImpl(
      _$_homePageInitial _value, $Res Function(_$_homePageInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_homePageInitial implements _homePageInitial {
  const _$_homePageInitial();

  @override
  String toString() {
    return 'HomePageState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_homePageInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserProfile currentUser) loaded,
    required TResult Function(String? message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserProfile currentUser)? loaded,
    TResult? Function(String? message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserProfile currentUser)? loaded,
    TResult Function(String? message)? error,
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
    required TResult Function(_homePageInitial value) initial,
    required TResult Function(_homePageLoading value) loading,
    required TResult Function(_homePageLoaded value) loaded,
    required TResult Function(_homePageError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_homePageInitial value)? initial,
    TResult? Function(_homePageLoading value)? loading,
    TResult? Function(_homePageLoaded value)? loaded,
    TResult? Function(_homePageError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_homePageInitial value)? initial,
    TResult Function(_homePageLoading value)? loading,
    TResult Function(_homePageLoaded value)? loaded,
    TResult Function(_homePageError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _homePageInitial implements HomePageState {
  const factory _homePageInitial() = _$_homePageInitial;
}

/// @nodoc
abstract class _$$_homePageLoadingCopyWith<$Res> {
  factory _$$_homePageLoadingCopyWith(
          _$_homePageLoading value, $Res Function(_$_homePageLoading) then) =
      __$$_homePageLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_homePageLoadingCopyWithImpl<$Res>
    extends _$HomePageStateCopyWithImpl<$Res, _$_homePageLoading>
    implements _$$_homePageLoadingCopyWith<$Res> {
  __$$_homePageLoadingCopyWithImpl(
      _$_homePageLoading _value, $Res Function(_$_homePageLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_homePageLoading implements _homePageLoading {
  const _$_homePageLoading();

  @override
  String toString() {
    return 'HomePageState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_homePageLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserProfile currentUser) loaded,
    required TResult Function(String? message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserProfile currentUser)? loaded,
    TResult? Function(String? message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserProfile currentUser)? loaded,
    TResult Function(String? message)? error,
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
    required TResult Function(_homePageInitial value) initial,
    required TResult Function(_homePageLoading value) loading,
    required TResult Function(_homePageLoaded value) loaded,
    required TResult Function(_homePageError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_homePageInitial value)? initial,
    TResult? Function(_homePageLoading value)? loading,
    TResult? Function(_homePageLoaded value)? loaded,
    TResult? Function(_homePageError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_homePageInitial value)? initial,
    TResult Function(_homePageLoading value)? loading,
    TResult Function(_homePageLoaded value)? loaded,
    TResult Function(_homePageError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _homePageLoading implements HomePageState {
  const factory _homePageLoading() = _$_homePageLoading;
}

/// @nodoc
abstract class _$$_homePageLoadedCopyWith<$Res> {
  factory _$$_homePageLoadedCopyWith(
          _$_homePageLoaded value, $Res Function(_$_homePageLoaded) then) =
      __$$_homePageLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({UserProfile currentUser});

  $UserProfileCopyWith<$Res> get currentUser;
}

/// @nodoc
class __$$_homePageLoadedCopyWithImpl<$Res>
    extends _$HomePageStateCopyWithImpl<$Res, _$_homePageLoaded>
    implements _$$_homePageLoadedCopyWith<$Res> {
  __$$_homePageLoadedCopyWithImpl(
      _$_homePageLoaded _value, $Res Function(_$_homePageLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentUser = null,
  }) {
    return _then(_$_homePageLoaded(
      null == currentUser
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as UserProfile,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<$Res> get currentUser {
    return $UserProfileCopyWith<$Res>(_value.currentUser, (value) {
      return _then(_value.copyWith(currentUser: value));
    });
  }
}

/// @nodoc

class _$_homePageLoaded implements _homePageLoaded {
  const _$_homePageLoaded(this.currentUser);

  @override
  final UserProfile currentUser;

  @override
  String toString() {
    return 'HomePageState.loaded(currentUser: $currentUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_homePageLoaded &&
            (identical(other.currentUser, currentUser) ||
                other.currentUser == currentUser));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_homePageLoadedCopyWith<_$_homePageLoaded> get copyWith =>
      __$$_homePageLoadedCopyWithImpl<_$_homePageLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserProfile currentUser) loaded,
    required TResult Function(String? message) error,
  }) {
    return loaded(currentUser);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserProfile currentUser)? loaded,
    TResult? Function(String? message)? error,
  }) {
    return loaded?.call(currentUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserProfile currentUser)? loaded,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(currentUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_homePageInitial value) initial,
    required TResult Function(_homePageLoading value) loading,
    required TResult Function(_homePageLoaded value) loaded,
    required TResult Function(_homePageError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_homePageInitial value)? initial,
    TResult? Function(_homePageLoading value)? loading,
    TResult? Function(_homePageLoaded value)? loaded,
    TResult? Function(_homePageError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_homePageInitial value)? initial,
    TResult Function(_homePageLoading value)? loading,
    TResult Function(_homePageLoaded value)? loaded,
    TResult Function(_homePageError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _homePageLoaded implements HomePageState {
  const factory _homePageLoaded(final UserProfile currentUser) =
      _$_homePageLoaded;

  UserProfile get currentUser;
  @JsonKey(ignore: true)
  _$$_homePageLoadedCopyWith<_$_homePageLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_homePageErrorCopyWith<$Res> {
  factory _$$_homePageErrorCopyWith(
          _$_homePageError value, $Res Function(_$_homePageError) then) =
      __$$_homePageErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$_homePageErrorCopyWithImpl<$Res>
    extends _$HomePageStateCopyWithImpl<$Res, _$_homePageError>
    implements _$$_homePageErrorCopyWith<$Res> {
  __$$_homePageErrorCopyWithImpl(
      _$_homePageError _value, $Res Function(_$_homePageError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_homePageError(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_homePageError implements _homePageError {
  const _$_homePageError(this.message);

  @override
  final String? message;

  @override
  String toString() {
    return 'HomePageState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_homePageError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_homePageErrorCopyWith<_$_homePageError> get copyWith =>
      __$$_homePageErrorCopyWithImpl<_$_homePageError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserProfile currentUser) loaded,
    required TResult Function(String? message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserProfile currentUser)? loaded,
    TResult? Function(String? message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserProfile currentUser)? loaded,
    TResult Function(String? message)? error,
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
    required TResult Function(_homePageInitial value) initial,
    required TResult Function(_homePageLoading value) loading,
    required TResult Function(_homePageLoaded value) loaded,
    required TResult Function(_homePageError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_homePageInitial value)? initial,
    TResult? Function(_homePageLoading value)? loading,
    TResult? Function(_homePageLoaded value)? loaded,
    TResult? Function(_homePageError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_homePageInitial value)? initial,
    TResult Function(_homePageLoading value)? loading,
    TResult Function(_homePageLoaded value)? loaded,
    TResult Function(_homePageError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _homePageError implements HomePageState {
  const factory _homePageError(final String? message) = _$_homePageError;

  String? get message;
  @JsonKey(ignore: true)
  _$$_homePageErrorCopyWith<_$_homePageError> get copyWith =>
      throw _privateConstructorUsedError;
}
