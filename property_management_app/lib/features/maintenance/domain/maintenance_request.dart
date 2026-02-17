import 'package:freezed_annotation/freezed_annotation.dart';

part 'maintenance_request.freezed.dart';
part 'maintenance_request.g.dart';

@freezed
class MaintenanceRequest with _$MaintenanceRequest {
  const factory MaintenanceRequest({
    required String id,
    required String userId,
    required String unitId,
    required String type, // 'Personal' or 'Community'
    required String description,
    required String status,
    required DateTime createdAt,
    @Default([]) List<String> attachments,
    String? preferredTimeSlot,
    String? assignedProviderId,
    DateTime? acceptedAt,
    DateTime? completedAt,
  }) = _MaintenanceRequest;

  factory MaintenanceRequest.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceRequestFromJson(json);
}
