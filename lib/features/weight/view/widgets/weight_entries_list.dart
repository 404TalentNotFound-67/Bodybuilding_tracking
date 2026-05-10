import 'package:flutter/material.dart';
import 'package:bodybuilding_tracking/features/weight/model/weight.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'weight_entry_tile.dart';

class WeightEntriesList extends StatefulWidget {
  final Function()? onEntryDeleted;

  const WeightEntriesList({super.key, this.onEntryDeleted});

  @override
  State<WeightEntriesList> createState() => _WeightEntriesListState();
}

class _WeightEntriesListState extends State<WeightEntriesList> {
  // @override
  // void initState() {
  //   super.initState();
  //   _loadEntries();
  // }

  // void _loadEntries() {
  //   setState(() {1
  //     // Sortiere nach Datum (neueste zuerst)
  //     _entries.sort((a, b) => b.date.compareTo(a.date));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Box<WeightEntry> box = Hive.box<WeightEntry>('weight');

    return ValueListenableBuilder(
      valueListenable: box.listenable(),
      builder: (context, Box<WeightEntry> box, _) {
        final List<WeightEntry> entries = box.values.toList()..sort((a, b) => b.date.compareTo(a.date));

        if (entries.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.scale_outlined, size: 64, color: theme.colorScheme.primary.withOpacity(0.3)),
                  const SizedBox(height: 16),
                  Text(
                    'Keine Gewichtseinträge vorhanden',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.onSurface.withOpacity(0.6)),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Füge einen neuen Eintrag hinzu, um zu starten',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurface.withOpacity(0.4)),
                  ),
                ],
              ),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: entries.length,
          itemBuilder: (context, index) {
            final WeightEntry entry = entries[index];
            return WeightEntryTile(entry: entry, onDelete: () {}, onDismissed: (direction) {});
          },
        );
      },
    );
  }
}
