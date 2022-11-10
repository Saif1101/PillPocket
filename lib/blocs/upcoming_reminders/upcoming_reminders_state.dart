part of 'upcoming_reminders_bloc.dart';

@freezed
class UpcomingRemindersState with _$UpcomingRemindersState {
  const factory UpcomingRemindersState.initial() = _Initial;
  const factory UpcomingRemindersState.loading() = _Loading;
  const factory UpcomingRemindersState.loaded(
    {required List<ReminderModel>? reminders}) = _Loaded;
  const factory UpcomingRemindersState.error(String? message) = _Error;
}
