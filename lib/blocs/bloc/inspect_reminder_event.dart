part of 'inspect_reminder_bloc.dart';

@freezed
class InspectReminderEvent with _$InspectReminderEvent {
  const factory InspectReminderEvent.started(ReminderModel? reminderModel) = _Started;
  const factory InspectReminderEvent.submitted(ReminderModel? reminderModel) = _Submit;

}