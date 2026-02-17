import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/document.dart';
import '../../../core/services/notification_service.dart';
import '../../../core/services/audit_service.dart';
import '../../../core/models/app_notification.dart';

/// Document Repository for Digital Passport
class DocumentRepository {
  final Ref ref;
  final List<Document> _documents = [];

  DocumentRepository(this.ref);

  /// Upload a document
  Future<Document> uploadDocument({
    String? unitId,
    String? buildingId,
    required String uploadedBy,
    required String title,
    required DocumentCategory category,
    required String fileUrl,
    String? fileType,
    DateTime? expiryDate,
    required DocumentVisibility visibility,
  }) async {
    final document = Document(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      unitId: unitId,
      buildingId: buildingId,
      uploadedBy: uploadedBy,
      title: title,
      category: category,
      fileUrl: fileUrl,
      fileType: fileType,
      expiryDate: expiryDate,
      visibility: visibility,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    _documents.add(document);

    // Audit log
    ref.read(auditServiceProvider).log(
      userId: uploadedBy,
      action: 'document_uploaded',
      module: 'documents',
      entityId: document.id,
      metadata: {
        'category': category.name,
        'visibility': visibility.name,
      },
    );

    return document;
  }

  /// Get documents with RBAC filtering
  List<Document> getDocuments({
    String? unitId,
    String? buildingId,
    String? userId,
    String? userRole,
  }) {
    var filtered = _documents;

    // Filter by unit or building
    if (unitId != null) {
      filtered = filtered.where((d) => d.unitId == unitId).toList();
    } else if (buildingId != null) {
      filtered = filtered.where((d) => d.buildingId == buildingId).toList();
    }

    // RBAC filtering
    if (userRole != 'supervisor') {
      filtered = filtered.where((d) {
        if (d.visibility == DocumentVisibility.all) return true;
        if (d.visibility == DocumentVisibility.owner && d.uploadedBy == userId) {
          return true;
        }
        return false;
      }).toList();
    }

    return filtered..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  /// Check for expiring documents and send alerts
  Future<void> checkExpiringDocuments() async {
    final expiring = _documents.where((d) => d.isExpiringSoon()).toList();

    for (final doc in expiring) {
      ref.read(notificationServiceProvider).sendNotification(
            userId: doc.uploadedBy,
            title: 'Document Expiring Soon',
            message:
                '${doc.title} expires in ${doc.expiryDate!.difference(DateTime.now()).inDays} days',
            type: NotificationType.document,
            priority: NotificationPriority.high,
          );
    }
  }

  /// Auto-categorize document (mock AI)
  DocumentCategory autoCategorizeMock(String filename) {
    final lower = filename.toLowerCase();
    if (lower.contains('contract') || lower.contains('agreement')) {
      return DocumentCategory.contract;
    }
    if (lower.contains('invoice') || lower.contains('bill')) {
      return DocumentCategory.invoice;
    }
    if (lower.contains('warranty') || lower.contains('guarantee')) {
      return DocumentCategory.warranty;
    }
    if (lower.contains('certificate') || lower.contains('cert')) {
      return DocumentCategory.certificate;
    }
    return DocumentCategory.other;
  }
}

final documentRepositoryProvider = Provider((ref) => DocumentRepository(ref));
