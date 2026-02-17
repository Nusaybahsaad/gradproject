import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/chat_group.dart';
import '../../../core/models/chat_message.dart';
import '../../../core/services/audit_service.dart';

/// Chat Repository for building-specific communications
class ChatRepository {
  final Ref ref;
  final List<ChatGroup> _groups = [];
  final List<ChatMessage> _messages = [];

  ChatRepository(this.ref);

  /// Create a chat group
  Future<ChatGroup> createGroup({
    required String buildingId,
    required String name,
    required ChatGroupType type,
  }) async {
    final group = ChatGroup(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      buildingId: buildingId,
      name: name,
      type: type,
      createdAt: DateTime.now(),
    );

    _groups.add(group);

    return group;
  }

  /// Send a message
  Future<ChatMessage> sendMessage({
    required String groupId,
    required String senderId,
    required String message,
    MessageType messageType = MessageType.text,
  }) async {
    final chatMessage = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      groupId: groupId,
      senderId: senderId,
      message: message,
      messageType: messageType,
      createdAt: DateTime.now(),
    );

    _messages.add(chatMessage);

    // Audit trail for all messages
    ref.read(auditServiceProvider).log(
      userId: senderId,
      action: 'message_sent',
      module: 'chat',
      entityId: groupId,
      metadata: {'message_type': messageType.name},
    );

    return chatMessage;
  }

  /// Get groups for a building
  List<ChatGroup> getGroupsForBuilding(String buildingId) {
    return _groups.where((g) => g.buildingId == buildingId).toList();
  }

  /// Get messages for a group
  List<ChatMessage> getMessages(String groupId) {
    return _messages.where((m) => m.groupId == groupId).toList()
      ..sort((a, b) => a.createdAt.compareTo(b.createdAt));
  }
}

final chatRepositoryProvider = Provider((ref) => ChatRepository(ref));
