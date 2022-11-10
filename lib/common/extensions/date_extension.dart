extension DateTimeExtension on List<DateTime>? {
  String getTimes(String separator) {
    String result = '';
    this?.forEach((element) {
      result += "${element.hour}:${element.minute} $separator";
    });
    return result;
  }
}
