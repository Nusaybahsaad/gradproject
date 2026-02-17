import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/maintenance_repository.dart';
import '../domain/maintenance_request.dart';
import '../domain/provider.dart';

final maintenanceRequestsProvider =
    FutureProvider<List<MaintenanceRequest>>((ref) async {
  final repository = ref.watch(maintenanceRepositoryProvider);
  return repository.getAllRequests();
});

final userMaintenanceRequestsProvider =
    FutureProvider.family<List<MaintenanceRequest>, String>(
  (ref, userId) async {
    final repository = ref.watch(maintenanceRepositoryProvider);
    return repository.getRequestsByUser(userId);
  },
);

final recommendedProvidersProvider =
    FutureProvider<List<MaintenanceProvider>>((ref) async {
  final repository = ref.watch(maintenanceRepositoryProvider);
  return repository.getRecommendedProviders();
});
