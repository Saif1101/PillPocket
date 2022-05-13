import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ScheduledNotification extends Equatable{
  final String title; 
  final int id;
  final int dayIndex; 
  final TimeOfDay timeOfDay;
  final String? body;

  const ScheduledNotification(
    {required this.title, 
    required this.id,
    required this.dayIndex, 
    required this.timeOfDay,
    this.body});

  @override
  List<Object?> get props =>[title,id,dayIndex,timeOfDay,body]; 

  @override
  bool? get stringify => true;
}