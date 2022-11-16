part of 'inspect_reminder_bloc.dart';

@freezed
class InspectReminderState with _$InspectReminderState {
  const factory InspectReminderState.initial() = _Initial;
  const factory InspectReminderState.loading() = _Loading;
  const factory InspectReminderState.loaded(ReminderModel? reminder) = _Loaded;
  const factory InspectReminderState.error({ReminderModel? reminder, String? errorMessage}) = _Error;
  const factory InspectReminderState.submitted() = _Submitted;
}
