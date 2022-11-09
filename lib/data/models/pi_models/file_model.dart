import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_model.freezed.dart';

part 'file_model.g.dart';

//Files here are images/pdfs of prescriptions 

enum FileType { image, pdf }

@freezed
class FileModel with _$FileModel {
  const FileModel._();

  @JsonSerializable(explicitToJson: true)
  const factory FileModel({
    String? uid,
    required String name,
    required String path,
    required FileType type,
  }) = _FileModel;

  factory FileModel.fromJson(Map<String, dynamic> json) =>
      _$FileModelFromJson(json);
}
