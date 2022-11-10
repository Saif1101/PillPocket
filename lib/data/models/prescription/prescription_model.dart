import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prescription_ocr/common/utils/timestamp_converter.dart';

part 'prescription_model.freezed.dart';
part 'prescription_model.g.dart';

@freezed
class PrescriptionModel with _$PrescriptionModel {


  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory PrescriptionModel({
    String? note,
    String? doctorName,
    String? prescriptionPhotoUrl,
    List<String>? linkedReminders,
    @TimestampConverter() DateTime? creationDateTime,
    String? cause,
    String? prescriptionTitle,
    String? prescriptionId,
  }) = _PrescriptionModel;

  factory PrescriptionModel.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionModelFromJson(json);

  factory PrescriptionModel.fromFireStore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    if (data != null) {
      return PrescriptionModel.fromJson(data);
    } else {
      return PrescriptionModel();
    }
  }
}
