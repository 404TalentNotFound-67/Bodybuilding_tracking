import 'package:bodybuilding_tracking/features/weight/data/weight_persistence.dart';
import 'package:bodybuilding_tracking/features/weight/data/weight.dart';
import 'package:flutter/material.dart';

class BodyWeightContainer extends StatelessWidget {
  const BodyWeightContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final WeightRepository weightRepository = WeightRepository();
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 8, offset: Offset(0, 4))],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Körpergewicht", style: Theme.of(context).textTheme.titleMedium),
              Spacer(flex: 1),
              IconButton(
                onPressed: () async {
                  DateTime key = DateTime.now();
                  WeightEntry entry = WeightEntry(date: key, weight: 71.2);
                  await weightRepository.addWeight(entry, key);

                  List<WeightEntry> allEntries = weightRepository.getAll();

                  print("New entries count: ${allEntries.length}");

                  for (WeightEntry entry in allEntries) {
                    print("Entry: ${entry.date} - ${entry.weight}");
                  }
                },
                icon: Icon(Icons.add, color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
          Text("Keine Einträge vorhanden"),
        ],
      ),
    );
  }
}
