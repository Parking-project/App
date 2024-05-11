import 'package:app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:app/routes/app_router.dart';

class Application extends StatefulWidget {
  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      
      // routerConfig: _router.config(),
    );
  }
}