import 'package:bodybuilding_tracking/core/ui/page_dashboard.dart';
import 'package:bodybuilding_tracking/core/ui/page_food_tracking.dart';
import 'package:bodybuilding_tracking/core/ui/page_progress.dart';
import 'package:bodybuilding_tracking/core/ui/page_settings.dart';
import 'package:bodybuilding_tracking/core/ui/page_training_tracking.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BodybuildingTrackingApp extends StatefulWidget {
  const BodybuildingTrackingApp({super.key});

  @override
  State<BodybuildingTrackingApp> createState() =>
      _BodybuildingTrackingAppState();
}

class _BodybuildingTrackingAppState extends State<BodybuildingTrackingApp> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    DashboardPage(),
    FoodTrackingPage(),
    TrainingTrackingPage(),
    ProgressPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(title: const Text("Bodybuilding Tracking App")),

      body: _widgetOptions.elementAt(_selectedIndex),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 15, vertical: 15),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[200]!,
              color: Colors.black,
              tabs: [
                GButton(icon: Icons.dashboard, text: 'Dashboard'),
                GButton(icon: Icons.restaurant, text: 'Ernährung'),
                GButton(icon: Icons.fitness_center, text: 'Training'),
                GButton(icon: Icons.show_chart, text: 'Fortschritt'),
                GButton(icon: Icons.settings, text: 'Settings'),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (value) {
                setState(() {
                  _selectedIndex = value;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
