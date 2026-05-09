import 'package:flutter/material.dart';
import 'package:bodybuilding_tracking/features/weight/model/weight.dart';

class WeightEntryTile extends StatelessWidget {
  final WeightEntry entry;
  final VoidCallback onDelete;
  final Function(DismissDirection)? onDismissed;

  const WeightEntryTile({super.key, required this.entry, required this.onDelete, this.onDismissed});

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dismissible(
      key: Key(entry.date.toString()),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        onDismissed?.call(direction);
      },
      confirmDismiss: (direction) async {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Eintrag löschen?'),
              content: Text('Möchtest du den Eintrag vom ${_formatDate(entry.date)} wirklich löschen?'),
              actions: [
                TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Abbrechen')),
                TextButton(
                  onPressed: () {
                    onDelete();
                    Navigator.pop(context, true);
                  },
                  style: TextButton.styleFrom(foregroundColor: theme.colorScheme.error),
                  child: const Text('Löschen'),
                ),
              ],
            );
          },
        );
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(color: theme.colorScheme.error, borderRadius: BorderRadius.circular(12)),
        child: Icon(Icons.delete_outline, color: theme.colorScheme.onError),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainer,
          border: Border.all(color: theme.colorScheme.primary.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Gewicht und Datum
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${entry.weight.toStringAsFixed(1)} kg',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _formatDate(entry.date),
                  style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurface.withOpacity(0.6)),
                ),
              ],
            ),
            // Hint für Swipe
            Icon(Icons.arrow_back_ios, size: 16, color: theme.colorScheme.onSurface.withOpacity(0.3)),
          ],
        ),
      ),
    );
  }
}
