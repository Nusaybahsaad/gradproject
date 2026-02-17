class UserSettings {
  final String id;
  final String userId;
  final bool pushNotifications;
  final bool emailNotifications;
  final bool paymentAlerts;
  final bool maintenanceAlerts;
  final bool voteAlerts;
  final bool chatAlerts;
  final String language;
  final DateTime createdAt;
  final DateTime updatedAt;

  const UserSettings({
    required this.id,
    required this.userId,
    this.pushNotifications = true,
    this.emailNotifications = true,
    this.paymentAlerts = true,
    this.maintenanceAlerts = true,
    this.voteAlerts = true,
    this.chatAlerts = true,
    this.language = 'en',
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserSettings.fromJson(Map<String, dynamic> json) {
    return UserSettings(
      id: json['id'],
      userId: json['user_id'],
      pushNotifications: json['push_notifications'] ?? true,
      emailNotifications: json['email_notifications'] ?? true,
      paymentAlerts: json['payment_alerts'] ?? true,
      maintenanceAlerts: json['maintenance_alerts'] ?? true,
      voteAlerts: json['vote_alerts'] ?? true,
      chatAlerts: json['chat_alerts'] ?? true,
      language: json['language'] ?? 'en',
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'push_notifications': pushNotifications,
      'email_notifications': emailNotifications,
      'payment_alerts': paymentAlerts,
      'maintenance_alerts': maintenanceAlerts,
      'vote_alerts': voteAlerts,
      'chat_alerts': chatAlerts,
      'language': language,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  UserSettings copyWith({
    bool? pushNotifications,
    bool? emailNotifications,
    bool? paymentAlerts,
    bool? maintenanceAlerts,
    bool? voteAlerts,
    bool? chatAlerts,
    String? language,
  }) {
    return UserSettings(
      id: id,
      userId: userId,
      pushNotifications: pushNotifications ?? this.pushNotifications,
      emailNotifications: emailNotifications ?? this.emailNotifications,
      paymentAlerts: paymentAlerts ?? this.paymentAlerts,
      maintenanceAlerts: maintenanceAlerts ?? this.maintenanceAlerts,
      voteAlerts: voteAlerts ?? this.voteAlerts,
      chatAlerts: chatAlerts ?? this.chatAlerts,
      language: language ?? this.language,
      createdAt: createdAt,
      updatedAt: DateTime.now(),
    );
  }
}
