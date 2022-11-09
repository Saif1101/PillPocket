part of 'profile_page_bloc.dart';

@freezed
class ProfilePageState with _$ProfilePageState {
  const factory ProfilePageState.initial() = _Initial;
  const factory ProfilePageState.ProfileLoading() = _ProfileLoadingState;
  const factory ProfilePageState.ProfileLoadedState(
      {required UserProfile userProfile}) = _ProfileLoadedState;
  const factory ProfilePageState.ErrorState() = _ErrorState; 

}
