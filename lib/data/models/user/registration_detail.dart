import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


class RegistrationDetail extends Equatable {
  String? firstName=''; 
  String? lastName='';

  String? mobileNumber='';
  String? age='';
  
  @override

  List<Object?> get props => [firstName, lastName, mobileNumber, age];

  @override

  bool? get stringify => true;

}
