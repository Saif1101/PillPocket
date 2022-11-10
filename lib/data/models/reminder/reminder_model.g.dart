// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReminderModel _$$_ReminderModelFromJson(Map<String, dynamic> json) =>
    _$_ReminderModel(
      prescriptionID: json['prescription_i_d'] as String?,
      mealCombination: json['meal_combination'] as int?,
      dosage: json['dosage'] as int?,
      reminderTitle: json['reminder_title'] as String?,
      reminderId: json['reminder_id'] as String?,
      reminderDays: (json['reminder_days'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      reminderTimes: (json['reminder_times'] as List<dynamic>?)
          ?.map((e) => const TimestampConverter().fromJson(e as Timestamp))
          .toList(),
      medicines: (json['medicines'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$_ReminderModelToJson(_$_ReminderModel instance) =>
    <String, dynamic>{
      'prescription_i_d': instance.prescriptionID,
      'meal_combination': instance.mealCombination,
      'dosage': instance.dosage,
      'reminder_title': instance.reminderTitle,
      'reminder_id': instance.reminderId,
      'reminder_days': instance.reminderDays,
      'reminder_times': instance.reminderTimes
          ?.map(const TimestampConverter().toJson)
          .toList(),
      'medicines': instance.medicines,
      'note': instance.note,
    };
