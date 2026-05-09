import 'package:bodybuilding_tracking/features/weight/model/time_frame.dart';
import 'package:bodybuilding_tracking/features/weight/view/widgets/time_frame_selector.dart';
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
        title: Text("Fortschritt"),
        centerTitle: true,
        actions: [Padding(padding: EdgeInsets.all(16), child: Icon(Icons.add))],
      ),
      body: Column(
        children: [
          TimeFrameSelectorButton(
            selectedTimeFrame: selectedTimeFrame,
            onTimeFrameSelected: (tf) => setState(() => selectedTimeFrame = tf),
          ),
        ],
      ),
    );
  }
}
