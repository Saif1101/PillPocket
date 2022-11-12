extension DateTimeExtension on List<DateTime>? {
  String getTimes(String separator) {
    String result = '';
    this?.forEach((element) {
      result += "${element.hour.toString().padLeft(2,'0')}:${element.minute.toString().padRight(2,'0')} $separator";
    });
    return result;
  }
}
