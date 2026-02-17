import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/theme/app_theme.dart';
import 'core/localization/app_localizations.dart';
import 'core/localization/language_provider.dart';
import 'features/auth/presentation/login_screen.dart';
import 'features/auth/presentation/register_screen.dart';
import 'features/auth/presentation/role_selection_screen.dart';
import 'features/dashboard/presentation/dashboard_router.dart';
import 'features/maintenance/presentation/maintenance_list_screen.dart';
import 'features/maintenance/presentation/create_request_screen.dart';
import 'features/maintenance/presentation/provider_list_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(languageProvider);

    return MaterialApp(
      title: 'Property Management',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      locale: locale,
      supportedLocales: const [
        Locale('en', ''),
        Locale('ar', ''),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/role_selection': (context) => const RoleSelectionScreen(),
        '/dashboard': (context) => const DashboardRouter(),
        '/maintenance': (context) => const MaintenanceListScreen(),
        '/maintenance/create': (context) =>
            const CreateMaintenanceRequestScreen(),
        '/providers': (context) => const ProviderListScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/register') {
          final args = settings.arguments as String?;
          return MaterialPageRoute(
            builder: (context) {
              return RegisterScreen(selectedRole: args ?? 'tenant');
            },
          );
        }
        return null;
      },
    );
  }
}
