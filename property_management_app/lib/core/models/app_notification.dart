class AppNotification {
  final String id;
  final String userId;
  final String title;
  final String message;
  final NotificationType type;
  final NotificationPriority priority;
  final bool isRead;
  final String? actionUrl;
  final DateTime createdAt;

  const AppNotification({
    required this.id,
    required this.userId,
    required this.title,
    required this.message,
    required this.type,
    this.priority = NotificationPriority.normal,
    this.isRead = false,
    this.actionUrl,
    required this.createdAt,
  });

  factory AppNotification.fromJson(Map<String, dynamic> json) {
    return AppNotification(
      id: json['id'],
      userId: json['user_id'],
      title: json['title'],
      message: json['message'],
      type: NotificationType.values.byName(json['type']),
      priority:
          NotificationPriority.values.byName(json['priority'] ?? 'normal'),
      isRead: json['is_read'] ?? false,
      actionUrl: json['action_url'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'title': title,
      'message': message,
      'type': type.name,
      'priority': priority.name,
      'is_read': isRead,
      'action_url': actionUrl,
      'created_at': createdAt.toIso8601String(),
    };
  }

  AppNotification copyWith({bool? isRead}) {
    return AppNotification(
      id: id,
      userId: userId,
      title: title,
      message: message,
      type: type,
      priority: priority,
      isRead: isRead ?? this.isRead,
      actionUrl: actionUrl,
      createdAt: createdAt,
    );
  }
}

enum NotificationType {
  payment,
  maintenance,
  vote,
  document,
  visit,
  chat,
  system
}

enum NotificationPriority { low, normal, high, urgent }
