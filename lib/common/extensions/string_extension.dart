extension StringListExtension on List<String>? {

  String getWords(String separator) {
    String result = '';
    this?.forEach((element) {
      result += "${element} $separator";
    });
    return result;
  }

}