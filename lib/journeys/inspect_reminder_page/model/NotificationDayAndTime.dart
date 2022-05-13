import 'package:flutter/material.dart';

class NotificationDayAndTime{
  final int dayIndex; 
  final TimeOfDay timeOfDay;

  NotificationDayAndTime({required this.dayIndex, required this.timeOfDay}); 

  @override
  String toString() {
    print('Day : $dayIndex, Time ${timeOfDay.format}');
    return super.toString();
  }
}