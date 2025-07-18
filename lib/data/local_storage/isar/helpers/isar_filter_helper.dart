
import 'package:isar/isar.dart';

class DynamicIsarFilter<T> {
  T value;
  FilterConditionType strategy;
  bool include1;
  bool include2;

  DynamicIsarFilter({
    required this.value,
    required this.strategy,
    this.include1 = false,
    this.include2 = false,
  });

  bool isStrategyValid() {
    if (value is String) {
      return _stringCompatibleStrategies.contains(strategy);
    } else if (value is num) {
      return _numberCompatibleStrategies.contains(strategy);
    } else if (value is DateTime) {
      return _dateCompatibleStrategies.contains(strategy);
    } else if (value is bool) {
      return _boolCompatibleStrategies.contains(strategy);
    } else if (value is List<num> && strategy == FilterConditionType.between) {
      return true;
    }

    return false;
  }

  static const _stringCompatibleStrategies = {
    FilterConditionType.equalTo,
    FilterConditionType.startsWith,
    FilterConditionType.endsWith,
    FilterConditionType.contains,
  };

  static const _numberCompatibleStrategies = {
    FilterConditionType.equalTo,
    FilterConditionType.lessThan,
    FilterConditionType.greaterThan,
    FilterConditionType.between,
  };

  static const _dateCompatibleStrategies = {
    FilterConditionType.equalTo,
    FilterConditionType.lessThan,
    FilterConditionType.greaterThan,
    FilterConditionType.between,
  };

  static const _boolCompatibleStrategies = {
    FilterConditionType.equalTo,
  };
}
