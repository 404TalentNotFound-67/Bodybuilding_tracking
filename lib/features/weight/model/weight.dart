import 'package:hive_ce/hive.dart';

part 'weight.g.dart';

@HiveType(typeId: 0)
class WeightEntry {
  @HiveField(0)
  final DateTime date;

  @HiveField(1)
  final double weight;

  WeightEntry({required this.date, required this.weight});
}
