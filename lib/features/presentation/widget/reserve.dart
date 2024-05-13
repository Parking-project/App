import 'package:app/features/domain/entity/reserve_api_entity.dart';
import 'package:app/features/presentation/widget/base_container.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReserveCard extends StatelessWidget {
  const ReserveCard({
    super.key,
    required this.child,
    required this.reserve,
    this.state,
  });

  final ReserveEntity reserve;
  final Widget child;
  final String? state;

  String _getTimestampFormat(int timestamp) {
    final datetime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat('dd.MM.yyyy HH:mm:ss').format(datetime);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 8),
      child: BaseConatiner(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "  ${reserve.place_code}  ",
                  style: theme.textTheme.titleLarge,
                ),
                Column(
                  children: [
                    Text(
                      "От ${_getTimestampFormat(reserve.begin)}",
                      style: theme.textTheme.titleMedium,
                    ),
                    Text(
                      "До ${_getTimestampFormat(reserve.end)}",
                      style: theme.textTheme.titleMedium,
                    ),
                  ],
                ),
              ],
            ),
            child
          ],
        ),
      ),
    );
  }
}
