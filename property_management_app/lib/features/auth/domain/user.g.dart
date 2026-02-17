// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      role: json['role'] as String,
      profilePictureUrl: json['profilePictureUrl'] as String?,
      hideProfilePicture: json['hideProfilePicture'] as bool? ?? false,
      restrictToBuildingOnly: json['restrictToBuildingOnly'] as bool? ?? false,
      unitId: json['unitId'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'role': instance.role,
      'profilePictureUrl': instance.profilePictureUrl,
      'hideProfilePicture': instance.hideProfilePicture,
      'restrictToBuildingOnly': instance.restrictToBuildingOnly,
      'unitId': instance.unitId,
    };
