/// firebase user profile
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory UserProfile({
    String? uId,
    String? profilePhotoUrl,
    String? firstName,
    String? lastName,
    String? age,
    String? emailId,
    String? mobileNumber,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  factory UserProfile.fromFireStore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    if (data != null) {
      return UserProfile.fromJson(data);
    } else {
      return const UserProfile();
    }
  }
}
