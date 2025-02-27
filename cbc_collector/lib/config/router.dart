import 'package:flutter/material.dart';
import 'package:cbc_collector/features/auth/screens/auth_screen.dart';
import 'package:cbc_collector/features/main/screens/main_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as Map<String, dynamic>?;
    final onLocaleChange = args?['onLocaleChange'] as Function(Locale)?;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => AuthScreen(
            onLocaleChange: onLocaleChange ?? ((_) {}),
          ),
        );
      case '/main':
        return MaterialPageRoute(
          builder: (_) => MainScreen(
            onLocaleChange: onLocaleChange,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
