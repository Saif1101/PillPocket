// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'file_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FileModel _$FileModelFromJson(Map<String, dynamic> json) {
  return _FileModel.fromJson(json);
}

/// @nodoc
mixin _$FileModel {
  String? get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  FileType get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FileModelCopyWith<FileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileModelCopyWith<$Res> {
  factory $FileModelCopyWith(FileModel value, $Res Function(FileModel) then) =
      _$FileModelCopyWithImpl<$Res, FileModel>;
  @useResult
  $Res call({String? uid, String name, String path, FileType type});
}

/// @nodoc
class _$FileModelCopyWithImpl<$Res, $Val extends FileModel>
    implements $FileModelCopyWith<$Res> {
  _$FileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? name = null,
    Object? path = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FileType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FileModelCopyWith<$Res> implements $FileModelCopyWith<$Res> {
  factory _$$_FileModelCopyWith(
          _$_FileModel value, $Res Function(_$_FileModel) then) =
      __$$_FileModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? uid, String name, String path, FileType type});
}

/// @nodoc
class __$$_FileModelCopyWithImpl<$Res>
    extends _$FileModelCopyWithImpl<$Res, _$_FileModel>
    implements _$$_FileModelCopyWith<$Res> {
  __$$_FileModelCopyWithImpl(
      _$_FileModel _value, $Res Function(_$_FileModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? name = null,
    Object? path = null,
    Object? type = null,
  }) {
    return _then(_$_FileModel(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FileType,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_FileModel extends _FileModel {
  const _$_FileModel(
      {this.uid, required this.name, required this.path, required this.type})
      : super._();

  factory _$_FileModel.fromJson(Map<String, dynamic> json) =>
      _$$_FileModelFromJson(json);

  @override
  final String? uid;
  @override
  final String name;
  @override
  final String path;
  @override
  final FileType type;

  @override
  String toString() {
    return 'FileModel(uid: $uid, name: $name, path: $path, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FileModel &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, name, path, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FileModelCopyWith<_$_FileModel> get copyWith =>
      __$$_FileModelCopyWithImpl<_$_FileModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FileModelToJson(
      this,
    );
  }
}

abstract class _FileModel extends FileModel {
  const factory _FileModel(
      {final String? uid,
      required final String name,
      required final String path,
      required final FileType type}) = _$_FileModel;
  const _FileModel._() : super._();

  factory _FileModel.fromJson(Map<String, dynamic> json) =
      _$_FileModel.fromJson;

  @override
  String? get uid;
  @override
  String get name;
  @override
  String get path;
  @override
  FileType get type;
  @override
  @JsonKey(ignore: true)
  _$$_FileModelCopyWith<_$_FileModel> get copyWith =>
      throw _privateConstructorUsedError;
}
