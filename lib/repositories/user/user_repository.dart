import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prescription_ocr/data/models/user/registration_detail.dart';
import 'package:prescription_ocr/data/models/user/user_profile.dart';

class UserRepository {
  final sessionStorage = GetStorage();
  final _db = FirebaseFirestore.instance.collection("users").withConverter(
      fromFirestore: (
        DocumentSnapshot<Map<String, dynamic>> snapshot,
        SnapshotOptions? options,
      ) {
        return UserProfile.fromJson(snapshot.data()!);
      },
      toFirestore: (UserProfile userProfile, _) => userProfile.toJson());

  Future<UserProfile?> getUserDetails(String uId) {
    return _db.where('u_id', isEqualTo: uId).limit(1).get().then((event) {
      if (event.docs.isNotEmpty) {
        return event.docs.single.data();
      }
      return null;
    });
  }

  Future<bool> checkRegistration(String uId) {
    return _db.where('u_id', isEqualTo: uId).limit(1).get().then((event) {
      if (event.docs.isNotEmpty) {
        return true;
      }
      return false;
    });
  }

  Future<void> save(UserProfile profile) {
    return _db.doc(profile.uId).set(profile, SetOptions(merge: true));
  }

  Future<void> setSessionUser(UserProfile currentUser) async {
    print("Writing user id: ${currentUser.uId}");
    await sessionStorage.write('currentUserId', currentUser.uId);
    await sessionStorage.write('firstName', currentUser.firstName);
    await sessionStorage.write('lastName', currentUser.lastName);
    await sessionStorage.write('profilePhotoUrl', currentUser.profilePhotoUrl);
    await sessionStorage.write('age', currentUser.age);
    await sessionStorage.write('mobileNumber', currentUser.mobileNumber);
    await sessionStorage.write('email', currentUser.emailId);
  }

  Future<UserProfile> getSessionUser() async {
    

    final uId = await sessionStorage.read('currentUserId');
    final firstName = await sessionStorage.read('firstName');
    final lastName = await sessionStorage.read('lastName');
    final profilePhotoUrl = await sessionStorage.read('profilePhotoUrl');
    final age = await sessionStorage.read('age');
    final mobileNumber = await sessionStorage.read('mobileNumber');
    final email = await sessionStorage.read('email');

    print("Fetching user id: ${uId}");

    return UserProfile(
        uId: uId,
        firstName: firstName,
        lastName: lastName,
        profilePhotoUrl: profilePhotoUrl,
        age: age,
        mobileNumber: mobileNumber,
        emailId: email);
  }

  Future<void> registerNewUser(RegistrationDetail registrationDetail) {
    User? currentUser = FirebaseAuth.instance.currentUser;
    UserProfile newProfile = UserProfile(
        uId: currentUser?.uid,
        profilePhotoUrl: currentUser?.photoURL,
        firstName: registrationDetail.firstName,
        lastName: registrationDetail.lastName,
        age: registrationDetail.age,
        emailId: currentUser?.email,
        mobileNumber: registrationDetail.mobileNumber);
    return _db.doc().set(newProfile, SetOptions(merge: true));
  }
}
