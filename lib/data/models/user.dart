import 'package:equatable/equatable.dart';

class User extends Equatable{
    final int userID;
    final String dateOfBirth;
    final String name; 
    final String username;

  const User({required this.userID, required this.dateOfBirth, required this.name, required this.username});

  @override
  List<Object?> get props => throw UnimplementedError();

  @override
  bool? get stringify => true; 
}