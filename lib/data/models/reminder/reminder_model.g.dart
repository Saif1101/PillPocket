// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReminderModel _$$_ReminderModelFromJson(Map<String, dynamic> json) =>
    _$_ReminderModel(
      prescriptionID: json['prescription_i_d'] as String?,
      reminderId: json['reminder_id'] as String?,
      notificationId: json['notification_id'] as int?,
      mealCombination: (json['meal_combination'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as bool),
      ),
      cause: json['cause'] as String?,
      reminderTitle: json['reminder_title'] as String?,
      selectedDays: (json['selected_days'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as bool),
      ),
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
      'reminder_id': instance.reminderId,
      'notification_id': instance.notificationId,
      'meal_combination': instance.mealCombination,
      'cause': instance.cause,
      'reminder_title': instance.reminderTitle,
      'selected_days': instance.selectedDays,
      'reminder_times': instance.reminderTimes
          ?.map(const TimestampConverter().toJson)
          .toList(),
      'medicines': instance.medicines,
      'note': instance.note,
    };
