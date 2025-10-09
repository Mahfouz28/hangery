import 'package:flutter/material.dart';

extension ContextNavigation on BuildContext {
  /// Navigate to a named route
  void pushNamed(String routeName, {Object? arguments}) {
    Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  /// Replace current route with a named route
  void pushReplacementNamed(String routeName, {Object? arguments}) {
    Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);
  }

  /// Push a named route and remove all previous routes
  void pushNamedAndRemoveUntil(String routeName, {Object? arguments}) {
    Navigator.of(this).pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  /// Pop the current route
  void pop<T extends Object?>([T? result]) {
    Navigator.of(this).pop(result);
  }

  /// Pop until the first route
  void popToFirst() {
    Navigator.of(this).popUntil((route) => route.isFirst);
  }
}
