import 'package:bodybuilding_tracking/core/theme/theme_provider.dart';
import 'package:bodybuilding_tracking/core/ui/main_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  // runApp(const Main());
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const Main(),
    ),
  );
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bodybuilding Tracking App",
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const BodybuildingTrackingApp(),
    );
  }
}
