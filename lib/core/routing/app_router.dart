import 'package:flutter/material.dart';
import 'package:hangery/core/routing/routs.dart';
import 'package:hangery/splash_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routs.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      default:
        return MaterialPageRoute(builder: (_) => const Text('Error'));
    }
  }
}
