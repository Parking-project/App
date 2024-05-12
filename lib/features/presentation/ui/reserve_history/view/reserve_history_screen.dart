import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class ReserveHistoryScreen extends StatelessWidget {
  const ReserveHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Бронирования"),
      ),
      body: const Text(
        "Hello",
      ),
    );
  }
}