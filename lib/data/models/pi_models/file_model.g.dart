// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FileModel _$$_FileModelFromJson(Map<String, dynamic> json) => _$_FileModel(
      uid: json['uid'] as String?,
      name: json['name'] as String,
      path: json['path'] as String,
      type: $enumDecode(_$FileTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$_FileModelToJson(_$_FileModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'path': instance.path,
      'type': _$FileTypeEnumMap[instance.type]!,
    };

const _$FileTypeEnumMap = {
  FileType.image: 'image',
  FileType.pdf: 'pdf',
};
