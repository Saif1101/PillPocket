// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _UserProfile.fromJson(json);
}

/// @nodoc
mixin _$UserProfile {
  String? get uId => throw _privateConstructorUsedError;
  String? get profilePhotoUrl => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get age => throw _privateConstructorUsedError;
  String? get emailId => throw _privateConstructorUsedError;
  String? get mobileNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
          UserProfile value, $Res Function(UserProfile) then) =
      _$UserProfileCopyWithImpl<$Res, UserProfile>;
  @useResult
  $Res call(
      {String? uId,
      String? profilePhotoUrl,
      String? firstName,
      String? lastName,
      String? age,
      String? emailId,
      String? mobileNumber});
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res, $Val extends UserProfile>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uId = freezed,
    Object? profilePhotoUrl = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? age = freezed,
    Object? emailId = freezed,
    Object? mobileNumber = freezed,
  }) {
    return _then(_value.copyWith(
      uId: freezed == uId
          ? _value.uId
          : uId // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePhotoUrl: freezed == profilePhotoUrl
          ? _value.profilePhotoUrl
          : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String?,
      emailId: freezed == emailId
          ? _value.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserProfileCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$$_UserProfileCopyWith(
          _$_UserProfile value, $Res Function(_$_UserProfile) then) =
      __$$_UserProfileCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? uId,
      String? profilePhotoUrl,
      String? firstName,
      String? lastName,
      String? age,
      String? emailId,
      String? mobileNumber});
}

/// @nodoc
class __$$_UserProfileCopyWithImpl<$Res>
    extends _$UserProfileCopyWithImpl<$Res, _$_UserProfile>
    implements _$$_UserProfileCopyWith<$Res> {
  __$$_UserProfileCopyWithImpl(
      _$_UserProfile _value, $Res Function(_$_UserProfile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uId = freezed,
    Object? profilePhotoUrl = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? age = freezed,
    Object? emailId = freezed,
    Object? mobileNumber = freezed,
  }) {
    return _then(_$_UserProfile(
      uId: freezed == uId
          ? _value.uId
          : uId // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePhotoUrl: freezed == profilePhotoUrl
          ? _value.profilePhotoUrl
          : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String?,
      emailId: freezed == emailId
          ? _value.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_UserProfile implements _UserProfile {
  const _$_UserProfile(
      {this.uId,
      this.profilePhotoUrl,
      this.firstName,
      this.lastName,
      this.age,
      this.emailId,
      this.mobileNumber});

  factory _$_UserProfile.fromJson(Map<String, dynamic> json) =>
      _$$_UserProfileFromJson(json);

  @override
  final String? uId;
  @override
  final String? profilePhotoUrl;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? age;
  @override
  final String? emailId;
  @override
  final String? mobileNumber;

  @override
  String toString() {
    return 'UserProfile(uId: $uId, profilePhotoUrl: $profilePhotoUrl, firstName: $firstName, lastName: $lastName, age: $age, emailId: $emailId, mobileNumber: $mobileNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserProfile &&
            (identical(other.uId, uId) || other.uId == uId) &&
            (identical(other.profilePhotoUrl, profilePhotoUrl) ||
                other.profilePhotoUrl == profilePhotoUrl) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.emailId, emailId) || other.emailId == emailId) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uId, profilePhotoUrl, firstName,
      lastName, age, emailId, mobileNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserProfileCopyWith<_$_UserProfile> get copyWith =>
      __$$_UserProfileCopyWithImpl<_$_UserProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserProfileToJson(
      this,
    );
  }
}

abstract class _UserProfile implements UserProfile {
  const factory _UserProfile(
      {final String? uId,
      final String? profilePhotoUrl,
      final String? firstName,
      final String? lastName,
      final String? age,
      final String? emailId,
      final String? mobileNumber}) = _$_UserProfile;

  factory _UserProfile.fromJson(Map<String, dynamic> json) =
      _$_UserProfile.fromJson;

  @override
  String? get uId;
  @override
  String? get profilePhotoUrl;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get age;
  @override
  String? get emailId;
  @override
  String? get mobileNumber;
  @override
  @JsonKey(ignore: true)
  _$$_UserProfileCopyWith<_$_UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}
