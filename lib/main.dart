import 'package:bodybuilding_tracking/core/ui/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bodybuilding Tracking App",
      //theme: ,
      //darkTheme: ,
      //themeMode: ,
      home: const BodybuildingTrackingApp(),
    );
  }
}
