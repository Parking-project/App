import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class ReserveScreen extends StatelessWidget {
  const ReserveScreen({required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          "Бронирование",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: const Text(
        "Hello",
      ),
    );
  }
}