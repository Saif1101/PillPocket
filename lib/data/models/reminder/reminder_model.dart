import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prescription_ocr/common/utils/timestamp_converter.dart';

part 'reminder_model.freezed.dart';
part 'reminder_model.g.dart';


@freezed
class ReminderModel with _$ReminderModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory ReminderModel({
    String? prescriptionID,
    int? mealCombination,
    int? dosage,
    String? reminderTitle,
    String? reminderId,
    List<String>? reminderDays,
    @TimestampConverter() List<DateTime>? reminderTimes,
    List<String>? medicines,
    String? note,
  }) = _ReminderModel;

  factory ReminderModel.fromJson(Map<String, dynamic> json) =>
      _$ReminderModelFromJson(json);

  factory ReminderModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    if (data != null) {
      return ReminderModel.fromJson(data);
    } else {
      return ReminderModel();
    }
  }
}
