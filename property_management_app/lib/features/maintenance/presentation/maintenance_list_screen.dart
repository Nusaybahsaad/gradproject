import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../auth/presentation/auth_provider.dart';
import 'maintenance_provider.dart';
import 'create_request_screen.dart';

class MaintenanceListScreen extends ConsumerWidget {
  const MaintenanceListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(authProvider);
    
    return userAsync.when(
      data: (user) {
        if (user == null) {
          return const Scaffold(
            body: Center(child: Text('Please login')),
          );
        }

        final requestsAsync = user.role == 'tenant' || user.role == 'owner'
            ? ref.watch(userMaintenanceRequestsProvider(user.id))
            : ref.watch(maintenanceRequestsProvider);

        return Scaffold(
          appBar: AppBar(
            title: const Text('Maintenance Requests'),
          ),
          body: requestsAsync.when(
            data: (requests) {
              if (requests.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.build, size: 64, color: Colors.grey.shade400),
                      const SizedBox(height: 16),
                      const Text('No maintenance requests'),
                      if (user.role == 'tenant') ...[
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const CreateMaintenanceRequestScreen(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.add),
                          label: const Text('Create Request'),
                        ),
                      ],
                    ],
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: requests.length,
                itemBuilder: (context, index) {
                  final request = requests[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: ExpansionTile(
                      leading: _getStatusIcon(request.status),
                      title: Text(
                        request.description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        '${request.type} • ${_formatDate(request.createdAt)}',
                      ),
                      trailing: _getStatusChip(request.status),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Timeline',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 16),
                              _buildTimeline(request),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(child: Text('Error: $error')),
          ),
          floatingActionButton: user.role == 'tenant'
              ? FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateMaintenanceRequestScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('New Request'),
                )
              : null,
        );
      },
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stack) => Scaffold(
        body: Center(child: Text('Error: $error')),
      ),
    );
  }

  Widget _getStatusIcon(String status) {
    switch (status) {
      case 'Submitted':
        return const CircleAvatar(
          backgroundColor: Colors.orange,
          child: Icon(Icons.schedule, color: Colors.white),
        );
      case 'Accepted':
      case 'In Progress':
        return const CircleAvatar(
          backgroundColor: Colors.blue,
          child: Icon(Icons.construction, color: Colors.white),
        );
      case 'Completed':
        return const CircleAvatar(
          backgroundColor: Colors.green,
          child: Icon(Icons.check, color: Colors.white),
        );
      default:
        return const CircleAvatar(
          backgroundColor: Colors.grey,
          child: Icon(Icons.help, color: Colors.white),
        );
    }
  }

  Widget _getStatusChip(String status) {
    Color color;
    switch (status) {
      case 'Submitted':
        color = Colors.orange;
        break;
      case 'Accepted':
      case 'In Progress':
        color = Colors.blue;
        break;
      case 'Completed':
        color = Colors.green;
        break;
      default:
        color = Colors.grey;
    }

    return Chip(
      label: Text(
        status,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
      backgroundColor: color,
      padding: EdgeInsets.zero,
    );
  }

  Widget _buildTimeline(request) {
    final steps = [
      {'title': 'Submitted', 'date': request.createdAt, 'completed': true},
      {
        'title': 'Assigned',
        'date': request.assignedProviderId != null ? request.createdAt : null,
        'completed': request.assignedProviderId != null,
      },
      {
        'title': 'Accepted',
        'date': request.acceptedAt,
        'completed': request.acceptedAt != null,
      },
      {
        'title': 'Completed',
        'date': request.completedAt,
        'completed': request.completedAt != null,
      },
    ];

    return Column(
      children: steps.asMap().entries.map((entry) {
        final step = entry.value;
        final isLast = entry.key == steps.length - 1;

        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Icon(
                    step['completed'] as bool ? Icons.check_circle : Icons.circle_outlined,
                    color: step['completed'] as bool ? Colors.green : Colors.grey,
                    size: 24,
                  ),
                  if (!isLast)
                    Expanded(
                      child: Container(
                        width: 2,
                        color: Colors.grey.shade300,
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        step['title'] as String,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: step['completed'] as bool ? Colors.black : Colors.grey,
                        ),
                      ),
                      if (step['date'] != null)
                        Text(
                          _formatDate(step['date'] as DateTime),
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return '${date.month}/${date.day}/${date.year}';
    }
  }
}
