// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PrescriptionModel _$$_PrescriptionModelFromJson(Map<String, dynamic> json) =>
    _$_PrescriptionModel(
      note: json['note'] as String?,
      doctorName: json['doctor_name'] as String?,
      prescriptionPhotoUrl: json['prescription_photo_url'] as String?,
      linkedReminders: (json['linked_reminders'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      creationDateTime: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['creation_date_time'], const TimestampConverter().fromJson),
      cause: json['cause'] as String?,
      prescriptionTitle: json['prescription_title'] as String?,
      prescriptionId: json['prescription_id'] as String?,
    );

Map<String, dynamic> _$$_PrescriptionModelToJson(
        _$_PrescriptionModel instance) =>
    <String, dynamic>{
      'note': instance.note,
      'doctor_name': instance.doctorName,
      'prescription_photo_url': instance.prescriptionPhotoUrl,
      'linked_reminders': instance.linkedReminders,
      'creation_date_time': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.creationDateTime, const TimestampConverter().toJson),
      'cause': instance.cause,
      'prescription_title': instance.prescriptionTitle,
      'prescription_id': instance.prescriptionId,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
