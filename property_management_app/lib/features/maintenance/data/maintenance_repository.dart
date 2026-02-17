import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/maintenance_request.dart';
import '../domain/provider.dart' as maintenance;

// Mock repository for maintenance requests
class MaintenanceRepository {
  final List<MaintenanceRequest> _requests = [
    MaintenanceRequest(
      id: '1',
      userId: '2',
      unitId: 'unit-102',
      type: 'Personal',
      description: 'Leaky faucet in bathroom',
      status: 'Submitted',
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
    ),
    MaintenanceRequest(
      id: '2',
      userId: '2',
      unitId: 'unit-102',
      type: 'Community',
      description: 'Broken elevator',
      status: 'In Progress',
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
      assignedProviderId: 'prov-1',
    ),
  ];

  final List<maintenance.MaintenanceProvider> _providers = [
    const maintenance.MaintenanceProvider(
      id: 'prov-1',
      name: 'QuickFix Plumbing',
      specialty: 'Plumbing',
      rating: 4.8,
      completedJobs: 145,
      responseTime: '< 2 hours',
      averagePrice: 85.0,
    ),
    const maintenance.MaintenanceProvider(
      id: 'prov-2',
      name: 'ElectroMaster Services',
      specialty: 'Electrical',
      rating: 4.9,
      completedJobs: 203,
      responseTime: '< 1 hour',
      averagePrice: 95.0,
    ),
    const maintenance.MaintenanceProvider(
      id: 'prov-3',
      name: 'HomeRepair Pro',
      specialty: 'General',
      rating: 4.6,
      completedJobs: 87,
      responseTime: '< 4 hours',
      averagePrice: 75.0,
    ),
    const maintenance.MaintenanceProvider(
      id: 'prov-4',
      name: 'HVAC Specialists',
      specialty: 'HVAC',
      rating: 4.7,
      completedJobs: 156,
      responseTime: '< 3 hours',
      averagePrice: 110.0,
    ),
  ];

  Future<List<MaintenanceRequest>> getRequestsByUser(String userId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _requests.where((r) => r.userId == userId).toList();
  }

  Future<List<MaintenanceRequest>> getAllRequests() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return List.from(_requests);
  }

  Future<MaintenanceRequest> createRequest({
    required String userId,
    required String unitId,
    required String type,
    required String description,
    List<String> attachments = const [],
    String? preferredTimeSlot,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    final request = MaintenanceRequest(
      id: 'req-${DateTime.now().millisecondsSinceEpoch}',
      userId: userId,
      unitId: unitId,
      type: type,
      description: description,
      status: 'Submitted',
      createdAt: DateTime.now(),
      attachments: attachments,
      preferredTimeSlot: preferredTimeSlot,
    );

    _requests.add(request);
    return request;
  }

  Future<List<maintenance.MaintenanceProvider>> getRecommendedProviders(
      {String? issueType}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    // Simple AI mock: sort by rating
    final sorted = List<maintenance.MaintenanceProvider>.from(_providers);
    sorted.sort((a, b) => b.rating.compareTo(a.rating));
    return sorted;
  }

  Future<MaintenanceRequest> updateRequestStatus({
    required String requestId,
    required String status,
    String? providerId,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));

    final index = _requests.indexWhere((r) => r.id == requestId);
    if (index == -1) throw Exception('Request not found');

    final updated = _requests[index].copyWith(
      status: status,
      assignedProviderId: providerId,
      acceptedAt: status == 'Accepted' ? DateTime.now() : null,
      completedAt: status == 'Completed' ? DateTime.now() : null,
    );

    _requests[index] = updated;
    return updated;
  }
}

final maintenanceRepositoryProvider =
    Provider((ref) => MaintenanceRepository());
