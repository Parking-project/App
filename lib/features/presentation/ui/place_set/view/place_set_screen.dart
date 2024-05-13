import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class PlaceSetScreen extends StatelessWidget {
  const PlaceSetScreen({required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text(
        "Hello",
      ),
    );
  }
}