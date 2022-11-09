// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserProfile _$$_UserProfileFromJson(Map<String, dynamic> json) =>
    _$_UserProfile(
      uId: json['u_id'] as String?,
      profilePhotoUrl: json['profile_photo_url'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      age: json['age'] as String?,
      emailId: json['email_id'] as String?,
      mobileNumber: json['mobile_number'] as String?,
    );

Map<String, dynamic> _$$_UserProfileToJson(_$_UserProfile instance) =>
    <String, dynamic>{
      'u_id': instance.uId,
      'profile_photo_url': instance.profilePhotoUrl,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'age': instance.age,
      'email_id': instance.emailId,
      'mobile_number': instance.mobileNumber,
    };
