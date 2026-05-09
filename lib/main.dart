import 'package:bodybuilding_tracking/core/theme/theme_provider.dart';
import 'package:bodybuilding_tracking/core/ui/main_page.dart';
import 'package:bodybuilding_tracking/persistence/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();
  runApp(ChangeNotifierProvider(create: (context) => ThemeProvider(), child: const Main()));
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
