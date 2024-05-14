import 'package:app/features/presentation/widget/base_container.dart';
import 'package:flutter/material.dart';

class SettingsButtonCard extends StatelessWidget {
  const SettingsButtonCard({
    super.key,
    required this.title,
    required this.value,
    required this.cardChild,
    this.onPressed,
  });

  final String title;
  final bool value;
  final void Function()? onPressed;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 8),
      child: BaseConatiner(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontSize: 18,
              ),
            ),
            FilledButton(
              onPressed: onPressed,
              child: cardChild,
            ),
          ],
        ),
      ),
    );
  }
}
