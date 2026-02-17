import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../auth/presentation/auth_provider.dart';
import '../../finance/presentation/billing_screen.dart';
import '../../community/presentation/voting_screen.dart';
import '../../documents/presentation/document_vault_screen.dart';
import '../../ai_assistant/presentation/chatbot_screen.dart';

class TenantDashboard extends ConsumerWidget {
  const TenantDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(authProvider);

    return userAsync.when(
      data: (user) => Scaffold(
        appBar: AppBar(
          title: const Text('Tenant Dashboard'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                ref.read(authProvider.notifier).logout();
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome, ${user?.name}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Unit: ${user?.unitId ?? 'N/A'}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Quick Actions',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _buildActionCard(
                      icon: Icons.build,
                      title: 'New Maintenance Request',
                      color: Colors.orange,
                      onTap: () {
                        Navigator.pushNamed(context, '/maintenance/create');
                      },
                    ),
                    _buildActionCard(
                      icon: Icons.list,
                      title: 'My Requests',
                      color: Colors.blue,
                      onTap: () {
                        Navigator.pushNamed(context, '/maintenance');
                      },
                    ),
                    _buildActionCard(
                      icon: Icons.payment,
                      title: 'Pay Bills',
                      color: Colors.green,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BillingScreen(userId: user!.id),
                        ),
                      ),
                    ),
                    _buildActionCard(
                      icon: Icons.how_to_vote,
                      title: 'Vote',
                      color: Colors.purple,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => VotingScreen(
                            requestId: 'req_123', // Mock ID
                            userId: user!.id,
                          ),
                        ),
                      ),
                    ),
                    _buildActionCard(
                      icon: Icons.folder,
                      title: 'Documents',
                      color: Colors.brown,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DocumentVaultScreen(
                            userId: user!.id,
                            userRole: 'tenant',
                          ),
                        ),
                      ),
                    ),
                    _buildActionCard(
                      icon: Icons.smart_toy,
                      title: 'Ask AI',
                      color: Colors.teal,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ChatbotScreen(userId: user!.id),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stack) => Scaffold(
        body: Center(child: Text('Error: $error')),
      ),
    );
  }

  Widget _buildActionCard({
    required IconData icon,
    required String title,
    required Color color,
    VoidCallback? onTap,
  }) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: color),
              const SizedBox(height: 16),
              Text(
                title,
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
