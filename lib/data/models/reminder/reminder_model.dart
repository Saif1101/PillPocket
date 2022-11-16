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
    String? reminderId,
    int? notificationId,
    Map<String, bool>? mealCombination,
    String? cause,
    String? reminderTitle,
    
    Map<String, bool>? selectedDays,
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

  @override
  String toString() {
    // TODO: implement toString
    return 'PrescriptionID: $prescriptionID \nCause: ${cause} \nMealCombn: $mealCombination \nReminderID $reminderId \nReminderTitle $reminderTitle \nReminderTimes $reminderTimes \nSelectedDays $selectedDays \nMedicines $medicines \nNote $note';
  }
}
