import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:prescription_ocr/common/utils/file_utils.dart';
import 'package:prescription_ocr/data/models/pi_models/file_model.dart';

class FileRepository {
  static String? appDocPath;

  static Future<String> root() async {
    if (appDocPath != null) {
      return appDocPath!;
    } else {
      Directory _appDocDir = await getApplicationDocumentsDirectory();
      Directory _baseDir = Directory("${_appDocDir.path}/pillpocket/files/");
      if (!_baseDir.existsSync()) {
        _baseDir.createSync(recursive: true);
      }
      appDocPath = _baseDir.path;
      return appDocPath!;
    }
  }

  static Future<File> get(String fileUrl) async {
    return File(await root() + fileUrl);
  }

  static Future<List<FileModel>> saveFiles(List<FileModel> fileModels) async {
    List<FileModel> savedFiles = [];
    for (FileModel _unsavedFile in fileModels) {
      File? _savedFile;
      if (_unsavedFile.uid == null) {
        _unsavedFile = _unsavedFile.copyWith(uid: Util.getUid());
      }
      
      _savedFile = await FileRepository._add(
          sourceFile: File(_unsavedFile.path), fileName: _unsavedFile.uid!);
      savedFiles.add(_unsavedFile.copyWith(path: _savedFile.path));
    }
    return savedFiles;
  }

  //need to create a refactor add method to save the file online 
  static Future<File> _add(
      {required File sourceFile, required String fileName}) async {
    var _path = await root() + fileName;
    final extension = p.extension(sourceFile.path); // '.dart'
    _path = _path + extension;
    File file = sourceFile.copySync(_path);
    return file;
  }
  

  static Future<void> remove(List<String> fileUrls) async {
    try {
      for (String url in fileUrls) {
        var _file = File(url);
        _file.deleteSync();
        
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }

  static Future<String> getTempDirectory() async {
    Directory dir = await getTemporaryDirectory();
    print(await dir.listSync().toList());
    String tempDirPath = dir.path + '/';
    return tempDirPath;
  }

  static Future<void> clearTempDirectory() async {
    Directory dir = await getTemporaryDirectory();
    dir.deleteSync(recursive: true);
  }

  static Future<List<FileSystemEntity>> getFiles() async {
    var path = await root();
    final response = await Directory(path).list(recursive: false).toList();
    return response;
  }
}
