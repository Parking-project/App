import 'package:flutter/material.dart';
import 'package:app/features/application.dart';
import 'package:app/di/service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await init();
  runApp(const Application());
}