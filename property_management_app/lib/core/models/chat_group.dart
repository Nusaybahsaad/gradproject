class ChatGroup {
  final String id;
  final String buildingId;
  final String name;
  final ChatGroupType type;
  final DateTime createdAt;

  const ChatGroup({
    required this.id,
    required this.buildingId,
    required this.name,
    required this.type,
    required this.createdAt,
  });

  factory ChatGroup.fromJson(Map<String, dynamic> json) {
    return ChatGroup(
      id: json['id'],
      buildingId: json['building_id'],
      name: json['name'],
      type: ChatGroupType.values.byName(json['type']),
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'building_id': buildingId,
      'name': name,
      'type': type.name,
      'created_at': createdAt.toIso8601String(),
    };
  }
}

enum ChatGroupType { building, maintenance, general }
