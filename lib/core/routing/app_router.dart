import 'package:flutter/material.dart';
import 'package:hangery/core/routing/routs.dart';
import 'package:hangery/featuer/auth/view/login_view.dart';
import 'package:hangery/featuer/auth/view/sign_up_view.dart';
import 'package:hangery/splash_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routs.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case Routs.loginView:
        return MaterialPageRoute(builder: (_) => LoginView());

      case Routs.signUp:
        return MaterialPageRoute(builder: (_) => SignUpView());

      default:
        return MaterialPageRoute(builder: (_) => Text('Error'));
    }
  }
}
