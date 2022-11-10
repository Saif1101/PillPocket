import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prescription_ocr/data/models/reminder/reminder_model.dart';

class ReminderRepository {
  final _db = FirebaseFirestore.instance.collection("reminders");

  Future<List<ReminderModel>?> getAllReminders(String userId) {
    List<ReminderModel> reminders = [];
    return _db.doc(userId).collection('UserReminders').get().then((event) {
      if (event.docs.isNotEmpty) {
        event.docs.forEach((element) {
          reminders.add(ReminderModel.fromJson(element.data()));
        });
        return reminders;
      }
      return null;
    });
  }

  Future<ReminderModel?> getReminder(String userId, String reminderId) {
    return _db.doc(userId).collection('UserReminders').
    where('reminderID', isEqualTo: reminderId
    ).limit(1).get().then((event) {
      if (event.docs.isNotEmpty) {
        return ReminderModel.fromJson(event.docs.single.data());
      }
      return null;
    });
  }

   Future<void> save(String userId, ReminderModel reminderModel) {
    return _db.doc(userId).collection('UserReminders').doc(reminderModel.reminderId).set(reminderModel.toJson(), SetOptions(merge: true));
  }
}
