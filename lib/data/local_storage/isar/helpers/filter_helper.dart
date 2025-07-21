
import 'package:isar/isar.dart';

class DynamicIsarFilter<T> {
  T value;
  FilterConditionType strategy;

  DynamicIsarFilter({
    required this.value,
    required this.strategy
  });

}