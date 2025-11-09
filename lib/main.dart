import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hangery/app.dart';
import 'package:hangery/core/utils/auth_manger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthManager.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}
