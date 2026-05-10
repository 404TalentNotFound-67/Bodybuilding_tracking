import 'package:bodybuilding_tracking/features/weight/model/time_frame.dart';
import 'package:bodybuilding_tracking/features/weight/view/add_weight_page.dart';
import 'package:bodybuilding_tracking/features/weight/view/widgets/time_frame_selector.dart';
import 'package:bodybuilding_tracking/features/weight/view/widgets/weight_entries_list.dart';
import 'package:flutter/material.dart';

class BodyWeightProgress extends StatefulWidget {
  const BodyWeightProgress({super.key});

  @override
  State<BodyWeightProgress> createState() => _BodyWeightProgressState();
}

class _BodyWeightProgressState extends State<BodyWeightProgress> {
  TimeFrame selectedTimeFrame = TimeFrame.threeMonths;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fortschritt"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: IconButton(
              onPressed: () async {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const AddBodyWeightEntryPage()));
              },
              icon: const Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Range selector for time frame
          TimeFrameSelectorButton(
            selectedTimeFrame: selectedTimeFrame,
            onTimeFrameSelected: (tf) => setState(() => selectedTimeFrame = tf),
          ),
          // Weight entries list
          Expanded(child: WeightEntriesList(onEntryDeleted: () {})),
        ],
      ),
    );
  }
}
