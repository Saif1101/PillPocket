part of 'login_bloc.dart';

abstract class LoginState extends Equatable{
  @override 
  List<Object?> get props => [];
}

class Initial extends LoginState{}

class Loading extends LoginState{}

class Authenticated extends LoginState{}

class UnAuthenticated extends LoginState{}

class LoginError extends LoginState{
  final String error;

  LoginError(this.error); 

  @override
  List<Object?> get props => [error];
}
