import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DatabaseRepository {
  /// initialize the hive database
  static final String _dbName = "pillpocket";
  static const String _dbPath = "pillpocket/db/";


  static Future<String> root() async {
    Directory _appDocDir = await getApplicationDocumentsDirectory();
    String path = ("${_appDocDir.path}/$_dbPath");
    return path;
  }

  /// puts entry in db for last write
  // updateTimeStamp() {
  //   db.put("dataUpdateTimestamp", DateTime.now().toIso8601String());
  // }

}