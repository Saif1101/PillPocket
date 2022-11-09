part of 'home_page_bloc.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState.initial() = _homePageInitial;
  const factory HomePageState.loading() = _homePageLoading;
  const factory HomePageState.loaded(UserProfile currentUser) = _homePageLoaded;
  const factory HomePageState.error(String? message) = _homePageError;
}
