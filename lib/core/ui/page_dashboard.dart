import 'package:bodybuilding_tracking/features/weight/view/body_weight._container.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(padding: EdgeInsets.only(left: 20, right: 20), child: BodyWeightContainer()),
    );
  }
}
