import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/community_vote.dart';
import '../../../core/services/audit_service.dart';

/// Community Voting Repository
class VotingRepository {
  final Ref ref;
  final List<CommunityVote> _votes = [];

  VotingRepository(this.ref);

  /// Cast a vote
  Future<CommunityVote> castVote({
    required String requestId,
    required String userId,
    required VoteType voteType,
    String? providerId,
  }) async {
    // Check if user already voted
    final existingVote = _votes.firstWhere(
      (v) => v.requestId == requestId && v.userId == userId,
      orElse: () => CommunityVote(
        id: '',
        requestId: requestId,
        userId: userId,
        voteType: voteType,
        createdAt: DateTime.now(),
      ),
    );

    if (existingVote.id.isNotEmpty) {
      throw Exception('User has already voted on this request');
    }

    final vote = CommunityVote(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      requestId: requestId,
      userId: userId,
      voteType: voteType,
      providerId: providerId,
      createdAt: DateTime.now(),
    );

    _votes.add(vote);

    // Audit log
    ref.read(auditServiceProvider).log(
      userId: userId,
      action: 'vote_cast',
      module: 'community',
      entityId: requestId,
      metadata: {'vote_type': voteType.name, 'provider_id': providerId},
    );

    return vote;
  }

  /// Get votes for a request
  List<CommunityVote> getVotes(String requestId) {
    return _votes.where((v) => v.requestId == requestId).toList();
  }

  /// Get vote summary for a request
  VoteSummary getVoteSummary(String requestId) {
    final votes = getVotes(requestId);
    final approvals = votes.where((v) => v.voteType == VoteType.approve).length;
    final rejections = votes.where((v) => v.voteType == VoteType.reject).length;

    return VoteSummary(
      totalVotes: votes.length,
      approvals: approvals,
      rejections: rejections,
      approvalRate: votes.isEmpty ? 0 : (approvals / votes.length) * 100,
    );
  }

  /// Check if request is approved (simple majority)
  bool isApproved(String requestId, {int minimumVotes = 3}) {
    final summary = getVoteSummary(requestId);
    return summary.totalVotes >= minimumVotes && summary.approvalRate > 50;
  }
}

class VoteSummary {
  final int totalVotes;
  final int approvals;
  final int rejections;
  final double approvalRate;

  const VoteSummary({
    required this.totalVotes,
    required this.approvals,
    required this.rejections,
    required this.approvalRate,
  });
}

final votingRepositoryProvider = Provider((ref) => VotingRepository(ref));
