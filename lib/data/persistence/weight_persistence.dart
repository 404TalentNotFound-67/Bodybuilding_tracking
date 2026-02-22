import 'package:bodybuilding_tracking/data/weight.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class WeightRepository {
  final Box<WeightEntry> _box = Hive.box<WeightEntry>('weight');

  Future<void> addWeight(WeightEntry entry, DateTime key) async {
    await _box.put(key.toString(), entry);
  }

  List<WeightEntry> getAll() {
    return _box.values.toList();
  }

  Future<void> delete(DateTime key) async {
    await _box.delete(key.toString());
  }
}
