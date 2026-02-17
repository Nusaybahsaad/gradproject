import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/app_notification.dart';

/// Mock notification service for demonstration
/// In production, integrate with Firebase Cloud Messaging or similar
class NotificationService {
  final List<AppNotification> _notifications = [];

  /// Send a notification to a user
  Future<void> sendNotification({
    required String userId,
    required String title,
    required String message,
    required NotificationType type,
    NotificationPriority priority = NotificationPriority.normal,
    String? actionUrl,
  }) async {
    final notification = AppNotification(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      userId: userId,
      title: title,
      message: message,
      type: type,
      priority: priority,
      actionUrl: actionUrl,
      createdAt: DateTime.now(),
    );

    _notifications.add(notification);

    // In production: Send push notification via FCM
    // In production: Send email notification if enabled
    print('📧 Notification sent to $userId: $title');
  }

  /// Get notifications for a specific user
  List<AppNotification> getNotifications(String userId) {
    return _notifications.where((n) => n.userId == userId).toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  /// Mark notification as read
  Future<void> markAsRead(String notificationId) async {
    final index = _notifications.indexWhere((n) => n.id == notificationId);
    if (index != -1) {
      _notifications[index] = _notifications[index].copyWith(isRead: true);
    }
  }

  /// Get unread count
  int getUnreadCount(String userId) {
    return _notifications.where((n) => n.userId == userId && !n.isRead).length;
  }
}

final notificationServiceProvider = Provider((ref) => NotificationService());
