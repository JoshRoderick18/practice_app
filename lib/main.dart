import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_app/core/dependency_injection/locator.dart';
import 'package:practice_app/core/router/router.dart' as router;
import 'package:stacked_services/stacked_services.dart' as services;

void main() {
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
  setupLocator();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: router.Router.loginView,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.Router.generateRoute,
      navigatorKey: services.StackedService.navigatorKey,
    );
  }
}
