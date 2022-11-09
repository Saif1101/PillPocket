import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:prescription_ocr/data/models/user/user_profile.dart';
import 'package:prescription_ocr/repositories/user/user_repository.dart';

part 'profile_page_event.dart';
part 'profile_page_state.dart';

part 'profile_page_bloc.freezed.dart';

class ProfilePageBloc extends Bloc<ProfilePageEvent, ProfilePageState> {
  final UserRepository userRepository;

  ProfilePageBloc(this.userRepository) : super(ProfilePageState.initial()) {
    on<ProfilePageEvent>(_onProfilePageEvent);
  }

  Future<void> _onProfilePageEvent(
      ProfilePageEvent event, Emitter<ProfilePageState> emit) {
    return event.map(started: (_) async {
      emit(const ProfilePageState.ProfileLoading());
      final UserProfile? prof = await userRepository
          .getUserDetails(FirebaseAuth.instance.currentUser!.uid);

      if (prof != null) {
        emit(ProfilePageState.ProfileLoadedState(userProfile: prof));
      } else {
        emit(const ProfilePageState.ErrorState());
      }
    });
  }
}
