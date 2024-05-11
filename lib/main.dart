import 'package:flutter/material.dart';
import 'package:app/di/service.dart';
import 'package:app/features/application.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(Application());
}