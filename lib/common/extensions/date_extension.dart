import 'package:flutter/material.dart';

extension DateTimeExtension on List<DateTime>? {
  String getTimes(String separator) {
    String result = '';
    this?.forEach((element) {
      result += "${element.hour.toString().padLeft(2,'0')}:${element.minute.toString().padRight(2,'0')} $separator";
    });
    return result;
  }
}


extension DateTimeExtension2 on DateTime {
  DateTime toDateTime(TimeOfDay time) {
    return DateTime(year, month, day, time.hour, time.minute);
  }

  String getTime(){
    return '${this.hour.toString().padLeft(2,'0')}:${this.minute.toString().padRight(2,'0')}';
  }

}