// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaintenanceProviderImpl _$$MaintenanceProviderImplFromJson(
        Map<String, dynamic> json) =>
    _$MaintenanceProviderImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      specialty: json['specialty'] as String,
      rating: (json['rating'] as num).toDouble(),
      completedJobs: (json['completedJobs'] as num).toInt(),
      responseTime: json['responseTime'] as String,
      averagePrice: (json['averagePrice'] as num).toDouble(),
      isVerified: json['isVerified'] as bool? ?? true,
    );

Map<String, dynamic> _$$MaintenanceProviderImplToJson(
        _$MaintenanceProviderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'specialty': instance.specialty,
      'rating': instance.rating,
      'completedJobs': instance.completedJobs,
      'responseTime': instance.responseTime,
      'averagePrice': instance.averagePrice,
      'isVerified': instance.isVerified,
    };
