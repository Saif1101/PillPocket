part of 'recent_prescriptions_bloc.dart';

@freezed
class RecentPrescriptionsEvent with _$RecentPrescriptionsEvent {
  const factory RecentPrescriptionsEvent.started() = _Started;
}