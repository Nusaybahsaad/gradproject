import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../auth/presentation/auth_provider.dart';
import 'owner_dashboard.dart';
import 'tenant_dashboard.dart';
import 'supervisor_dashboard.dart';
import 'provider_dashboard.dart';

class DashboardRouter extends ConsumerWidget {
  const DashboardRouter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(authProvider);

    return userAsync.when(
      data: (user) {
        if (user == null) {
          // Not logged in, redirect to login
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacementNamed(context, '/');
          });
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // Route to appropriate dashboard based on role
        switch (user.role) {
          case 'owner':
            return const OwnerDashboard();
          case 'tenant':
            return const TenantDashboard();
          case 'supervisor':
            return const SupervisorDashboard();
          case 'provider':
            return const ProviderDashboard();
          default:
            return Scaffold(
              appBar: AppBar(title: const Text('Error')),
              body: const Center(
                child: Text('Unknown user role'),
              ),
            );
        }
      },
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stack) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }
}
