import 'package:flutter/material.dart';
import 'package:practice_app/presentation/views/home_view.dart';
import 'package:practice_app/presentation/views/login_view.dart';

class Router {
  static const homeView = '/home-view';
  static const loginView = '/login-view';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeView:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
      case loginView:
        return MaterialPageRoute(
          builder: (_) => const LoginView(),
        );

      default:
        return null;
    }
  }
}
