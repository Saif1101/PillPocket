part of 'recent_prescriptions_bloc.dart';

@freezed
class RecentPrescriptionsState with _$RecentPrescriptionsState {
  const factory RecentPrescriptionsState.initial() = _Initial;
  const factory RecentPrescriptionsState.loading() = _Loading;
  const factory RecentPrescriptionsState.loaded(
    {required List<PrescriptionModel>? prescriptions}) = _Loaded;
  const factory RecentPrescriptionsState.error(String? message) = _Error;
}
