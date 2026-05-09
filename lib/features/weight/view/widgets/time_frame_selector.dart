import 'package:bodybuilding_tracking/features/weight/model/time_frame.dart';
import 'package:flutter/material.dart';

class TimeFrameSelector extends StatelessWidget {
  final void Function(TimeFrame) onTimeFrameSelected;
  final TimeFrame selectedTimeFrame;

  const TimeFrameSelector({super.key, required this.onTimeFrameSelected, required this.selectedTimeFrame});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: TimeFrame.values.map((TimeFrame tf) {
          return ListTile(
            title: Text(tf.displayString),
            onTap: () {
              onTimeFrameSelected(tf);
              Navigator.pop(context);
            },
            selected: selectedTimeFrame == tf,
            selectedTileColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
          );
        }).toList(),
      ),
    );
  }
}

class TimeFrameSelectorButton extends StatelessWidget {
  final TimeFrame selectedTimeFrame;
  final void Function(TimeFrame) onTimeFrameSelected;

  const TimeFrameSelectorButton({super.key, required this.selectedTimeFrame, required this.onTimeFrameSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () => showModalBottomSheet(
          context: context,
          builder: (context) => TimeFrameSelector(
            onTimeFrameSelected: (tf) => onTimeFrameSelected(tf),
            selectedTimeFrame: selectedTimeFrame,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.surface,
          foregroundColor: Theme.of(context).colorScheme.onSurface,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.calendar_today, color: Theme.of(context).colorScheme.primary),
            Spacer(flex: 1),
            Text(selectedTimeFrame.displayString),
            Spacer(flex: 1),
            Icon(Icons.arrow_drop_down, color: Theme.of(context).colorScheme.onSurface),
          ],
        ),
      ),
    );
  }
}
