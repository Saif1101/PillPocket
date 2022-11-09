import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prescription_ocr/data/models/user/registration_detail.dart';
import 'package:prescription_ocr/data/models/user/user_profile.dart';
import 'package:prescription_ocr/repositories/authentication/auth_repository.dart';
import 'package:prescription_ocr/repositories/user/user_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  final UserRepository userRepository;

  AuthBloc({required this.authRepository, required this.userRepository})
      : super(Initial()) {
    on<GoogleSignInRequested>((event, emit) async {
      emit(Loading());
      try {
        final user = await authRepository.signInWithGoogle();
        if (user != null) {
          final exists = await userRepository.checkRegistration(user.uid);
          if (exists) {
            //Fetch and Write user info to session storage
            final currentUserProfile =
                await userRepository.getUserDetails(user.uid);
            await userRepository.setSessionUser(currentUserProfile!);
            emit(Registered());
          } else {
            emit(Unregistered());
          }
        } else {
          emit(UnAuthenticated());
        }
      } catch (e) {
        emit(LoginError(e.toString()));
        emit(UnAuthenticated());
      }
    });

    on<SignOutRequested>((event, emit) async {
      emit(Loading());
      await authRepository.signOut();
      emit(UnAuthenticated());
    });

    on<RegistrationEvent>((event, emit) async {
      emit(Loading());
      await userRepository.registerNewUser(event.detail);
      emit(Registered());
    });
  }
}
