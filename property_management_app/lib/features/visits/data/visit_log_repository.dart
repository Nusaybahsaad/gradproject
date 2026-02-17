import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/visit_log.dart';
import '../../../core/services/notification_service.dart';
import '../../../core/services/audit_service.dart';
import '../../../core/models/app_notification.dart';

/// Visit Log Repository for real-time visit management
class VisitLogRepository {
  final Ref ref;
  final List<VisitLog> _visitLogs = [];

  VisitLogRepository(this.ref);

  /// Create a visit log
  Future<VisitLog> createVisit({
    required String requestId,
    required String providerId,
    required DateTime proposedTime,
  }) async {
    final visitLog = VisitLog(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      requestId: requestId,
      providerId: providerId,
      status: VisitStatus.scheduled,
      proposedTime: proposedTime,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    _visitLogs.add(visitLog);

    return visitLog;
  }

  /// Update visit status
  Future<VisitLog> updateStatus({
    required String visitId,
    required VisitStatus status,
    String? notes,
    String? residentId,
  }) async {
    final index = _visitLogs.indexWhere((v) => v.id == visitId);
    if (index == -1) throw Exception('Visit log not found');

    final now = DateTime.now();
    VisitLog updatedLog;

    switch (status) {
      case VisitStatus.on_the_way:
        updatedLog = _visitLogs[index].copyWith(status: status);
        break;
      case VisitStatus.arrived:
        updatedLog = _visitLogs[index].copyWith(
          status: status,
          arrivalTime: now,
        );
        break;
      case VisitStatus.work_started:
        updatedLog = _visitLogs[index].copyWith(
          status: status,
          startTime: now,
        );
        break;
      case VisitStatus.completed:
        updatedLog = _visitLogs[index].copyWith(
          status: status,
          completionTime: now,
          notes: notes,
        );
        break;
      default:
        updatedLog = _visitLogs[index].copyWith(status: status);
    }

    _visitLogs[index] = updatedLog;

    // Audit log
    ref.read(auditServiceProvider).log(
      userId: updatedLog.providerId,
      action: 'visit_status_updated',
      module: 'visits',
      entityId: visitId,
      metadata: {'status': status.name},
    );

    // Notify resident
    if (residentId != null) {
      String message = '';
      switch (status) {
        case VisitStatus.on_the_way:
          message = 'Your technician is on the way!';
          break;
        case VisitStatus.arrived:
          message = 'Your technician has arrived.';
          break;
        case VisitStatus.work_started:
          message = 'Work has started on your maintenance request.';
          break;
        case VisitStatus.completed:
          message = 'Your maintenance work is complete!';
          break;
        default:
          message = 'Visit status updated: ${status.name}';
      }

      ref.read(notificationServiceProvider).sendNotification(
            userId: residentId,
            title: 'Visit Update',
            message: message,
            type: NotificationType.visit,
            priority: NotificationPriority.high,
          );
    }

    return updatedLog;
  }

  /// Resident confirms proposed time
  Future<VisitLog> confirmVisit({
    required String visitId,
    required bool confirmed,
  }) async {
    final index = _visitLogs.indexWhere((v) => v.id == visitId);
    if (index == -1) throw Exception('Visit log not found');

    final updatedLog = _visitLogs[index].copyWith(
      residentConfirmed: confirmed,
    );

    if (confirmed) {
      updatedLog.copyWith(confirmedTime: updatedLog.proposedTime);
    }

    _visitLogs[index] = updatedLog;

    return updatedLog;
  }

  /// Get visit log for a request
  VisitLog? getVisitLog(String requestId) {
    try {
      return _visitLogs.firstWhere((v) => v.requestId == requestId);
    } catch (_) {
      return null;
    }
  }

  /// Get all visit logs for a provider
  List<VisitLog> getProviderVisits(String providerId) {
    return _visitLogs.where((v) => v.providerId == providerId).toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }
}

final visitLogRepositoryProvider = Provider((ref) => VisitLogRepository(ref));
