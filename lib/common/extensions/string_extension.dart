extension StringMapExtension on Map<String,bool>? {

  String getDays(String separator) {
    print(this!);
    String result = '';
    for (var element in this!.keys) { 
      if(this![element]!){
        result+='$element $separator';
      }
    }
    return result;
  }

}

