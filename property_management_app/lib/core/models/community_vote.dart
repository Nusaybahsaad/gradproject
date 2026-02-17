class CommunityVote {
  final String id;
  final String requestId;
  final String userId;
  final VoteType voteType;
  final String? providerId;
  final DateTime createdAt;

  const CommunityVote({
    required this.id,
    required this.requestId,
    required this.userId,
    required this.voteType,
    this.providerId,
    required this.createdAt,
  });

  factory CommunityVote.fromJson(Map<String, dynamic> json) {
    return CommunityVote(
      id: json['id'],
      requestId: json['request_id'],
      userId: json['user_id'],
      voteType: VoteType.values.byName(json['vote_type']),
      providerId: json['provider_id'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'request_id': requestId,
      'user_id': userId,
      'vote_type': voteType.name,
      'provider_id': providerId,
      'created_at': createdAt.toIso8601String(),
    };
  }
}

enum VoteType { approve, reject }
