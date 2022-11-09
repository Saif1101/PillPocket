part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Initial extends AuthState {}

class Loading extends AuthState {}

class Unregistered extends AuthState {}

class Registered extends AuthState {}

class UnAuthenticated extends AuthState {}

class LoginError extends AuthState {
  final String error;

  LoginError(this.error);

  @override
  List<Object?> get props => [error];
}

enum AuthStatus {
  unknown,
  unauthenticated,
  authenticated,
  otpCodeSent,
}
