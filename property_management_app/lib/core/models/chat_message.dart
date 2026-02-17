class ChatMessage {
  final String id;
  final String groupId;
  final String senderId;
  final String message;
  final MessageType messageType;
  final bool isAudited;
  final DateTime createdAt;

  const ChatMessage({
    required this.id,
    required this.groupId,
    required this.senderId,
    required this.message,
    this.messageType = MessageType.text,
    this.isAudited = true,
    required this.createdAt,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'],
      groupId: json['group_id'],
      senderId: json['sender_id'],
      message: json['message'],
      messageType: MessageType.values.byName(json['message_type'] ?? 'text'),
      isAudited: json['is_audited'] ?? true,
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'group_id': groupId,
      'sender_id': senderId,
      'message': message,
      'message_type': messageType.name,
      'is_audited': isAudited,
      'created_at': createdAt.toIso8601String(),
    };
  }
}

enum MessageType { text, image, file, vote }
