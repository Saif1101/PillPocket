// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'prescription_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PrescriptionModel _$PrescriptionModelFromJson(Map<String, dynamic> json) {
  return _PrescriptionModel.fromJson(json);
}

/// @nodoc
mixin _$PrescriptionModel {
  String? get note => throw _privateConstructorUsedError;
  String? get doctorName => throw _privateConstructorUsedError;
  String? get prescriptionPhotoUrl => throw _privateConstructorUsedError;
  List<String>? get linkedReminders => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get creationDateTime => throw _privateConstructorUsedError;
  String? get cause => throw _privateConstructorUsedError;
  String? get prescriptionTitle => throw _privateConstructorUsedError;
  String? get prescriptionId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PrescriptionModelCopyWith<PrescriptionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrescriptionModelCopyWith<$Res> {
  factory $PrescriptionModelCopyWith(
          PrescriptionModel value, $Res Function(PrescriptionModel) then) =
      _$PrescriptionModelCopyWithImpl<$Res, PrescriptionModel>;
  @useResult
  $Res call(
      {String? note,
      String? doctorName,
      String? prescriptionPhotoUrl,
      List<String>? linkedReminders,
      @TimestampConverter() DateTime? creationDateTime,
      String? cause,
      String? prescriptionTitle,
      String? prescriptionId});
}

/// @nodoc
class _$PrescriptionModelCopyWithImpl<$Res, $Val extends PrescriptionModel>
    implements $PrescriptionModelCopyWith<$Res> {
  _$PrescriptionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? note = freezed,
    Object? doctorName = freezed,
    Object? prescriptionPhotoUrl = freezed,
    Object? linkedReminders = freezed,
    Object? creationDateTime = freezed,
    Object? cause = freezed,
    Object? prescriptionTitle = freezed,
    Object? prescriptionId = freezed,
  }) {
    return _then(_value.copyWith(
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      doctorName: freezed == doctorName
          ? _value.doctorName
          : doctorName // ignore: cast_nullable_to_non_nullable
              as String?,
      prescriptionPhotoUrl: freezed == prescriptionPhotoUrl
          ? _value.prescriptionPhotoUrl
          : prescriptionPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      linkedReminders: freezed == linkedReminders
          ? _value.linkedReminders
          : linkedReminders // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      creationDateTime: freezed == creationDateTime
          ? _value.creationDateTime
          : creationDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cause: freezed == cause
          ? _value.cause
          : cause // ignore: cast_nullable_to_non_nullable
              as String?,
      prescriptionTitle: freezed == prescriptionTitle
          ? _value.prescriptionTitle
          : prescriptionTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      prescriptionId: freezed == prescriptionId
          ? _value.prescriptionId
          : prescriptionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PrescriptionModelCopyWith<$Res>
    implements $PrescriptionModelCopyWith<$Res> {
  factory _$$_PrescriptionModelCopyWith(_$_PrescriptionModel value,
          $Res Function(_$_PrescriptionModel) then) =
      __$$_PrescriptionModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? note,
      String? doctorName,
      String? prescriptionPhotoUrl,
      List<String>? linkedReminders,
      @TimestampConverter() DateTime? creationDateTime,
      String? cause,
      String? prescriptionTitle,
      String? prescriptionId});
}

/// @nodoc
class __$$_PrescriptionModelCopyWithImpl<$Res>
    extends _$PrescriptionModelCopyWithImpl<$Res, _$_PrescriptionModel>
    implements _$$_PrescriptionModelCopyWith<$Res> {
  __$$_PrescriptionModelCopyWithImpl(
      _$_PrescriptionModel _value, $Res Function(_$_PrescriptionModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? note = freezed,
    Object? doctorName = freezed,
    Object? prescriptionPhotoUrl = freezed,
    Object? linkedReminders = freezed,
    Object? creationDateTime = freezed,
    Object? cause = freezed,
    Object? prescriptionTitle = freezed,
    Object? prescriptionId = freezed,
  }) {
    return _then(_$_PrescriptionModel(
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      doctorName: freezed == doctorName
          ? _value.doctorName
          : doctorName // ignore: cast_nullable_to_non_nullable
              as String?,
      prescriptionPhotoUrl: freezed == prescriptionPhotoUrl
          ? _value.prescriptionPhotoUrl
          : prescriptionPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      linkedReminders: freezed == linkedReminders
          ? _value._linkedReminders
          : linkedReminders // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      creationDateTime: freezed == creationDateTime
          ? _value.creationDateTime
          : creationDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cause: freezed == cause
          ? _value.cause
          : cause // ignore: cast_nullable_to_non_nullable
              as String?,
      prescriptionTitle: freezed == prescriptionTitle
          ? _value.prescriptionTitle
          : prescriptionTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      prescriptionId: freezed == prescriptionId
          ? _value.prescriptionId
          : prescriptionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_PrescriptionModel implements _PrescriptionModel {
  const _$_PrescriptionModel(
      {this.note,
      this.doctorName,
      this.prescriptionPhotoUrl,
      final List<String>? linkedReminders,
      @TimestampConverter() this.creationDateTime,
      this.cause,
      this.prescriptionTitle,
      this.prescriptionId})
      : _linkedReminders = linkedReminders;

  factory _$_PrescriptionModel.fromJson(Map<String, dynamic> json) =>
      _$$_PrescriptionModelFromJson(json);

  @override
  final String? note;
  @override
  final String? doctorName;
  @override
  final String? prescriptionPhotoUrl;
  final List<String>? _linkedReminders;
  @override
  List<String>? get linkedReminders {
    final value = _linkedReminders;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @TimestampConverter()
  final DateTime? creationDateTime;
  @override
  final String? cause;
  @override
  final String? prescriptionTitle;
  @override
  final String? prescriptionId;

  @override
  String toString() {
    return 'PrescriptionModel(note: $note, doctorName: $doctorName, prescriptionPhotoUrl: $prescriptionPhotoUrl, linkedReminders: $linkedReminders, creationDateTime: $creationDateTime, cause: $cause, prescriptionTitle: $prescriptionTitle, prescriptionId: $prescriptionId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PrescriptionModel &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.doctorName, doctorName) ||
                other.doctorName == doctorName) &&
            (identical(other.prescriptionPhotoUrl, prescriptionPhotoUrl) ||
                other.prescriptionPhotoUrl == prescriptionPhotoUrl) &&
            const DeepCollectionEquality()
                .equals(other._linkedReminders, _linkedReminders) &&
            (identical(other.creationDateTime, creationDateTime) ||
                other.creationDateTime == creationDateTime) &&
            (identical(other.cause, cause) || other.cause == cause) &&
            (identical(other.prescriptionTitle, prescriptionTitle) ||
                other.prescriptionTitle == prescriptionTitle) &&
            (identical(other.prescriptionId, prescriptionId) ||
                other.prescriptionId == prescriptionId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      note,
      doctorName,
      prescriptionPhotoUrl,
      const DeepCollectionEquality().hash(_linkedReminders),
      creationDateTime,
      cause,
      prescriptionTitle,
      prescriptionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PrescriptionModelCopyWith<_$_PrescriptionModel> get copyWith =>
      __$$_PrescriptionModelCopyWithImpl<_$_PrescriptionModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PrescriptionModelToJson(
      this,
    );
  }
}

abstract class _PrescriptionModel implements PrescriptionModel {
  const factory _PrescriptionModel(
      {final String? note,
      final String? doctorName,
      final String? prescriptionPhotoUrl,
      final List<String>? linkedReminders,
      @TimestampConverter() final DateTime? creationDateTime,
      final String? cause,
      final String? prescriptionTitle,
      final String? prescriptionId}) = _$_PrescriptionModel;

  factory _PrescriptionModel.fromJson(Map<String, dynamic> json) =
      _$_PrescriptionModel.fromJson;

  @override
  String? get note;
  @override
  String? get doctorName;
  @override
  String? get prescriptionPhotoUrl;
  @override
  List<String>? get linkedReminders;
  @override
  @TimestampConverter()
  DateTime? get creationDateTime;
  @override
  String? get cause;
  @override
  String? get prescriptionTitle;
  @override
  String? get prescriptionId;
  @override
  @JsonKey(ignore: true)
  _$$_PrescriptionModelCopyWith<_$_PrescriptionModel> get copyWith =>
      throw _privateConstructorUsedError;
}
