import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prescription_ocr/data/models/prescription/prescription_model.dart';
import 'package:prescription_ocr/data/models/reminder/reminder_model.dart';

class PrescriptionRepository {
  final _db = FirebaseFirestore.instance.collection("prescriptions");

  Future<List<PrescriptionModel>?> getAllPrescription(String userId) {
    List<PrescriptionModel> prescriptions = [];
    return _db.doc(userId).collection('UserPrescriptions').get().then((event) {
      if (event.docs.isNotEmpty) {
        event.docs.forEach((element) {
          prescriptions.add(PrescriptionModel.fromJson(element.data()));
        });
        return prescriptions;
      }
      return null;
    });
  }

  Future<PrescriptionModel?> getPrescription(String userId, String prescriptionId) {
    return _db
        .doc(userId)
        .collection('UserPrescriptions')
        .where('prescriptionID', isEqualTo: prescriptionId)
        .limit(1)
        .get()
        .then((event) {
      if (event.docs.isNotEmpty) {
        return PrescriptionModel.fromJson(event.docs.single.data());
      }
      return null;
    });
  }

   Future<void> save(String userId, PrescriptionModel prescriptionModel) {
    return _db.doc(userId).collection('UserPrescriptions').doc(prescriptionModel.prescriptionId).set(prescriptionModel.toJson(), SetOptions(merge: true));
  }
}
