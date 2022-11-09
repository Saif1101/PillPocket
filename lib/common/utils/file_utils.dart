import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';

import 'package:path_provider/path_provider.dart';
import 'package:pdf_merger/pdf_merger.dart';
import 'package:file_picker/file_picker.dart' as filePicker;
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:prescription_ocr/data/models/pi_models/file_model.dart';
import 'package:prescription_ocr/repositories/database/database_repository.dart';
import 'package:uuid/uuid.dart';

class Util {
  static String getUid() {
    return Uuid().v1();
  }

  static Future<File?> cropper(File image, {bool? frontCamera}) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.blue,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: frontCamera != null
                ? CropAspectRatioPreset.square
                : CropAspectRatioPreset.ratio3x2,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );
    if (croppedFile != null) {
      return File(croppedFile.path);
    }
    return null;
  }

  static toUtcIsoString(DateTime dateTime) {
    String isoFormatted = dateTime.toUtc().toIso8601String();
    return isoFormatted;
  }

  static dateFromIsoToLocal(String iso, {DateFormat? format}) {
    format ??= DateFormat("d MMM yyyy");
    DateTime _localDate = DateTime.parse(iso).toLocal();
    return format.format(_localDate);
  }

  static localDateTimeFromIso(String data) {
    DateTime parsedDate;
    parsedDate = DateTime.parse(data);
    return parsedDate.toLocal();
  }

  static Future<FileModel?> filePick(BuildContext context,
      {String? fileName, List<FileModel> exisitingFiles = const []}) async {
    filePicker.FilePickerResult? result = await filePicker.FilePicker.platform
        .pickFiles(
            allowedExtensions: fileName == null
                ? ['png', 'jpg', 'jpeg', 'pdf']
                : ['png', 'jpg', 'jpeg'],
            type: filePicker.FileType.custom);
    FileModel? fileModel;
    final TextEditingController textEditingController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    if (result != null) {
      File file = File(result.files.single.path!);


      FileType _type = result.files.single.extension! == "pdf"
          ? FileType.pdf
          : FileType.image;

      fileModel = FileModel(path: file.path, type: _type, name: '');
      if (fileName == null) {
        await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return Form(
              key: _formKey,
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                insetPadding: EdgeInsets.symmetric(horizontal: 20),
                contentPadding: EdgeInsets.only(),
                content: Container(
                  width: double.maxFinite,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          'Change File Name',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          autofocus: true,
                          controller: textEditingController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Required";
                            }
                            return null;
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp("[A-Za-z0-9 #+-.]*")),
                          ],
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.assignment),
                            labelText: 'File Name',
                            hintText: 'Ex: file name',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    onPressed: () {
                      fileModel = null;
                      Navigator.pop(context);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ElevatedButton(
                      child: Text('Continue'),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          if (fileModel != null) {
                            String fileNameImp = textEditingController.text;
                            int count = 0;
                            while (exisitingFiles.any(
                                (element) => element.name == fileNameImp)) {
                              if (count > 0) {
                                int ind = fileNameImp.lastIndexOf("($count)");
                                fileNameImp = fileNameImp.substring(0, ind);
                              }
                              count++;
                              fileNameImp += "($count)";
                            }
                            fileModel = fileModel!.copyWith(name: fileNameImp);
                          }
                          Navigator.maybePop(context);
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      } else {
        fileModel = fileModel.copyWith(name: fileName);
      }
      return fileModel;
    } else {
      // User canceled the picker
      return fileModel;
    }
  }

  static Future<FileModel?> imageToPdf(List<FileModel> files) async {
    Directory tempDir = await getTemporaryDirectory();
    String outPut = "${tempDir.path}/${Util.getUid()}.pdf";
    CreatePDFFromMultipleImageResponse response =
        await PdfMerger.createPDFFromMultipleImage(
            paths: files.map((e) => e.path).toList(), outputDirPath: outPut);
    if (response.status == "success") {
      return FileModel(name: "lyik_merge", path: outPut, type: FileType.pdf);
    }
    return null;
  }

  static Future<FileModel?> mergeFilesAsPdf(List<FileModel> files) async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    List<FileModel> pdfsToBeMerged = [];

    /// convert all files to pdf
    for (FileModel _file in files) {
      print(File(_file.path));
      if (_file.type == FileType.pdf) {
        pdfsToBeMerged.add(_file);
      } else {
        FileModel? _pdf = await imageToPdf([_file]);
        if (_pdf != null) {
          pdfsToBeMerged.add(_pdf);
        }
      }
    }

    MergeMultiplePDFResponse response = await PdfMerger.mergeMultiplePDF(
        paths: pdfsToBeMerged.map((e) => e.path).toList(growable: false),
        outputDirPath: "${tempPath}/lyik_merged.pdf");
    if (response.status == "success") {
      FileModel outputFile = FileModel(
          name: "lyik_merge",
          path: "${tempPath}/lyik_merged.pdf",
          type: FileType.pdf);
      return outputFile;
    } else {
      debugPrint(response.message);
    }
    return null;
  }

  DatabaseRepository databaseRepository = DatabaseRepository();

  static String backupTimeFromTimestamp(String timestamp) {
    DateTime dateTime = DateTime.parse(timestamp);
    var formattedTimestamp = DateFormat('d MMM yyyy, kk:mm a').format(dateTime);
    print(formattedTimestamp);
    return formattedTimestamp;
  }

  static String? valueOrNull(String value) {
    return value.isEmpty ? null : value;
  }

}
