// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaintenanceRequestImpl _$$MaintenanceRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$MaintenanceRequestImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      unitId: json['unitId'] as String,
      type: json['type'] as String,
      description: json['description'] as String,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      attachments: (json['attachments'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      preferredTimeSlot: json['preferredTimeSlot'] as String?,
      assignedProviderId: json['assignedProviderId'] as String?,
      acceptedAt: json['acceptedAt'] == null
          ? null
          : DateTime.parse(json['acceptedAt'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
    );

Map<String, dynamic> _$$MaintenanceRequestImplToJson(
        _$MaintenanceRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'unitId': instance.unitId,
      'type': instance.type,
      'description': instance.description,
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
      'attachments': instance.attachments,
      'preferredTimeSlot': instance.preferredTimeSlot,
      'assignedProviderId': instance.assignedProviderId,
      'acceptedAt': instance.acceptedAt?.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
    };
