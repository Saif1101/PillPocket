part of 'upcoming_reminders_bloc.dart';

@freezed
class UpcomingRemindersEvent with _$UpcomingRemindersEvent {
  const factory UpcomingRemindersEvent.started() = _Started;
}