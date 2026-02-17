import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/visit_log.dart';
import '../data/visit_log_repository.dart';
import '../../../core/theme/app_theme.dart';
import 'package:intl/intl.dart';

class VisitManagementScreen extends ConsumerWidget {
  final String providerId;

  const VisitManagementScreen({super.key, required this.providerId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visitRepo = ref.read(visitLogRepositoryProvider);
    final visits = visitRepo.getProviderVisits(providerId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Visits'),
        backgroundColor: AppTheme.primaryColor,
      ),
      body: visits.isEmpty
          ? const Center(child: Text('No scheduled visits'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: visits.length,
              itemBuilder: (context, index) {
                return _VisitCard(visit: visits[index]);
              },
            ),
    );
  }
}

class _VisitCard extends ConsumerWidget {
  final VisitLog visit;

  const _VisitCard({required this.visit});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Request #${visit.requestId.substring(0, 8)}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                _StatusBadge(status: visit.status),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.access_time, size: 16, color: Colors.grey),
                const SizedBox(width: 8),
                Text(
                  visit.proposedTime != null
                      ? DateFormat('MMM dd, hh:mm a')
                          .format(visit.proposedTime!)
                      : 'Time not set',
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 8),
            Text(
              'Update Status',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Colors.grey.shade700,
                  ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _ActionButton(
                  icon: Icons.directions_car,
                  label: 'On Way',
                  isActive: visit.status == VisitStatus.scheduled,
                  onPressed: () =>
                      _updateStatus(context, ref, VisitStatus.on_the_way),
                ),
                _ActionButton(
                  icon: Icons.location_on,
                  label: 'Arrived',
                  isActive: visit.status == VisitStatus.on_the_way,
                  onPressed: () =>
                      _updateStatus(context, ref, VisitStatus.arrived),
                ),
                _ActionButton(
                  icon: Icons.play_arrow,
                  label: 'Start',
                  isActive: visit.status == VisitStatus.arrived,
                  onPressed: () =>
                      _updateStatus(context, ref, VisitStatus.work_started),
                ),
                _ActionButton(
                  icon: Icons.check_circle,
                  label: 'Done',
                  isActive: visit.status == VisitStatus.work_started,
                  onPressed: () => _showCompletionDialog(context, ref),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _updateStatus(
      BuildContext context, WidgetRef ref, VisitStatus status) async {
    try {
      await ref.read(visitLogRepositoryProvider).updateStatus(
            visitId: visit.id,
            status: status,
            // In a real app, you'd fetch the resident ID from the request
            residentId: 'resident_123',
          );
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  Future<void> _showCompletionDialog(
      BuildContext context, WidgetRef ref) async {
    final noteController = TextEditingController();

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Complete Job'),
        content: TextField(
          controller: noteController,
          decoration: const InputDecoration(
            hintText: 'Add completion notes...',
            border: OutlineInputBorder(),
          ),
          maxLines: 3,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context);
              try {
                await ref.read(visitLogRepositoryProvider).updateStatus(
                      visitId: visit.id,
                      status: VisitStatus.completed,
                      notes: noteController.text,
                      residentId: 'resident_123',
                    );
              } catch (e) {
                // Handle error
              }
            },
            child: const Text('Complete'),
          ),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final VisitStatus status;

  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;
    switch (status) {
      case VisitStatus.completed:
        color = Colors.green;
        break;
      case VisitStatus.work_started:
        color = Colors.blue;
        break;
      case VisitStatus.on_the_way:
        color = Colors.orange;
        break;
      default:
        color = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color),
      ),
      child: Text(
        status.name.replaceAll('_', ' ').toUpperCase(),
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onPressed;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: isActive ? onPressed : null,
          icon: Icon(icon),
          color: isActive ? AppTheme.primaryColor : Colors.grey.shade300,
          style: IconButton.styleFrom(
            backgroundColor: isActive
                ? AppTheme.primaryColor.withOpacity(0.1)
                : Colors.grey.shade100,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isActive ? AppTheme.primaryColor : Colors.grey,
          ),
        ),
      ],
    );
  }
}
