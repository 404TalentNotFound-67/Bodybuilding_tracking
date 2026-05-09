import 'package:flutter/material.dart';
import 'package:bodybuilding_tracking/features/weight/data/weight_persistence.dart';
import 'package:bodybuilding_tracking/features/weight/model/weight.dart';
import 'weight_entry_tile.dart';

class WeightEntriesList extends StatefulWidget {
  final Function()? onEntryDeleted;

  const WeightEntriesList({super.key, this.onEntryDeleted});

  @override
  State<WeightEntriesList> createState() => _WeightEntriesListState();
}

class _WeightEntriesListState extends State<WeightEntriesList> {
  late final WeightRepository _weightRepository;
  late List<WeightEntry> _entries;

  @override
  void initState() {
    super.initState();
    _weightRepository = WeightRepository();
    _loadEntries();
  }

  void _loadEntries() {
    setState(() {
      _entries = _weightRepository.getAll();
      // Sortiere nach Datum (neueste zuerst)
      _entries.sort((a, b) => b.date.compareTo(a.date));
    });
  }

  Future<void> _deleteEntry(WeightEntry entry) async {
    try {
      await _weightRepository.delete(entry.date);
      _loadEntries();
      widget.onEntryDeleted?.call();

      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Eintrag gelöscht'), duration: Duration(seconds: 2)));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Fehler beim Löschen: $e'),
            duration: const Duration(seconds: 2),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (_entries.isEmpty) {
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
      itemCount: _entries.length,
      itemBuilder: (context, index) {
        final entry = _entries[index];
        return WeightEntryTile(
          entry: entry,
          onDelete: () => _deleteEntry(entry),
          onDismissed: (direction) {
            _loadEntries();
          },
        );
      },
    );
  }
}
