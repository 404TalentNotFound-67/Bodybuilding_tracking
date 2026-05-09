import 'package:bodybuilding_tracking/features/weight/data/weight.dart';
import 'package:bodybuilding_tracking/hive_registrar.g.dart';
import 'package:hive_ce_flutter/adapters.dart';

class HiveService {
  static Future<void> init() async {
    await Hive.initFlutter("bodybuilding_tracking");

    Hive.registerAdapters();

    await Hive.openBox<WeightEntry>('weight');
  }
}
