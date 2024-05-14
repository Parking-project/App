import 'package:app/features/domain/entity/place_api_entity.dart';
import 'package:app/features/presentation/widget/base_container.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard({
    super.key,
    this.child,
    required this.place,
    this.state,
  });

  final PlaceEntity place;
  final Widget? child;
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
                  "  ${place.placeCode}  ",
                  style: theme.textTheme.titleLarge,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: child,
            )
          ],
        ),
      ),
    );
  }
}
