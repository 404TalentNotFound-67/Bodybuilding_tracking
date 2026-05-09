import 'package:bodybuilding_tracking/features/weight/data/weight_persistence.dart';
import 'package:bodybuilding_tracking/features/weight/model/weight.dart';
import 'package:bodybuilding_tracking/features/weight/view/add_weight_page.dart';
import 'package:bodybuilding_tracking/features/weight/view/body_weight_progress.dart';
import 'package:flutter/material.dart';

class BodyWeightContainer extends StatelessWidget {
  const BodyWeightContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final WeightRepository weightRepository = WeightRepository();
    List<WeightEntry> allEntries = weightRepository.getAll();

    // print("New entries count: ${allEntries.length}");

    // for (WeightEntry entry in allEntries) {
    //   print("Entry: ${entry.date} - ${entry.weight}");
    // }

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => BodyWeightProgress()));
      },
      child: Container(
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
                  onPressed: () =>
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const AddBodyWeightEntryPage())),
                  icon: Icon(Icons.add, color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),

            allEntries.isNotEmpty ? Text("${allEntries.length} Einträge vorhanden") : Text("Keine Einträge vorhanden"),

            //Text("Keine Einträge vorhanden"),
          ],
        ),
      ),
    );
  }
}
