import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Centralized audit logging service
/// Logs all critical system actions for compliance and debugging
class AuditService {
  final List<AuditEntry> _logs = [];

  /// Log an action
  Future<void> log({
    required String userId,
    required String action,
    required String module,
    String? entityId,
    Map<String, dynamic>? metadata,
  }) async {
    final entry = AuditEntry(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      userId: userId,
      action: action,
      module: module,
      entityId: entityId,
      metadata: metadata,
      timestamp: DateTime.now(),
    );

    _logs.add(entry);

    // In production: Store in database
    // In production: Send to analytics/monitoring service
    print('📝 AUDIT: [$module] $userId -> $action');
  }

  /// Get audit logs filtered by criteria
  List<AuditEntry> getLogs({
    String? userId,
    String? module,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    var filtered = _logs;

    if (userId != null) {
      filtered = filtered.where((e) => e.userId == userId).toList();
    }

    if (module != null) {
      filtered = filtered.where((e) => e.module == module).toList();
    }

    if (startDate != null) {
      filtered = filtered.where((e) => e.timestamp.isAfter(startDate)).toList();
    }

    if (endDate != null) {
      filtered = filtered.where((e) => e.timestamp.isBefore(endDate)).toList();
    }

    return filtered..sort((a, b) => b.timestamp.compareTo(a.timestamp));
  }
}

class AuditEntry {
  final String id;
  final String userId;
  final String action;
  final String module;
  final String? entityId;
  final Map<String, dynamic>? metadata;
  final DateTime timestamp;

  const AuditEntry({
    required this.id,
    required this.userId,
    required this.action,
    required this.module,
    this.entityId,
    this.metadata,
    required this.timestamp,
  });
}

final auditServiceProvider = Provider((ref) => AuditService());
