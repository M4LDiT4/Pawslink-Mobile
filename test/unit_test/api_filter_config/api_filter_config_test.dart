import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app_template/core/enums/filter_condition_type.dart';
import 'package:mobile_app_template/domain/repositories/api/api_filter_config.dart';

void main() {
  group('ApiFilterConfig validation', () {
    test('equals constructor accepts any value type', () {
      expect(() => ApiFilterConfig.equals('name', 'John'), returnsNormally);
      expect(() => ApiFilterConfig.equals('age', 30), returnsNormally);
    });

    test('startsWith requires String value', () {
      expect(() => ApiFilterConfig.startsWith('name', 'Jo'), returnsNormally);
    });

    test('greaterThan requires numeric value', () {
      expect(() => ApiFilterConfig.greaterThan('age', 20), returnsNormally);
    });

    test('inList requires Iterable value', () {
      expect(() => ApiFilterConfig.inList('tags', ['a', 'b', 'c']), returnsNormally);
    });

    test('between requires Iterable length 2 with numeric values', () {
      expect(() => ApiFilterConfig.between('age', [10, 20]), returnsNormally);
      expect(() => ApiFilterConfig.between('age', [10]), throwsFormatException);
      expect(() => ApiFilterConfig.between('age', [10, '20']), throwsFormatException);
    });

    test('isNull expects null value', () {
      expect(() => ApiFilterConfig.isNull('name'), returnsNormally);
      expect(() => ApiFilterConfig.isNull('name'), returnsNormally); // Still null
    });

    test('isNotNull expects null value', () {
      expect(() => ApiFilterConfig.isNotNull('name'), returnsNormally);
      expect(() => ApiFilterConfig.isNotNull('name'), returnsNormally);
    });

    test('exists allows bool or null', () {
      expect(() => ApiFilterConfig.exists('active', true), returnsNormally);
      expect(() => ApiFilterConfig.exists('active', null), returnsNormally);
      expect(() => ApiFilterConfig.exists('active', 'yes'), throwsFormatException);
    });
  });

  group('ApiFilterConfig unnamed constructor validation', () {
    test('startsWith requires String value', () {
      expect(() => ApiFilterConfig(FilterConditionType.startsWith, 'prefix', 'field'), returnsNormally);
      expect(() => ApiFilterConfig(FilterConditionType.startsWith, 123, 'field'), throwsFormatException);
    });

    test('endsWith requires String value', () {
      expect(() => ApiFilterConfig(FilterConditionType.endsWith, 'suffix', 'field'), returnsNormally);
      expect(() => ApiFilterConfig(FilterConditionType.endsWith, 456, 'field'), throwsFormatException);
    });

    test('contains requires String value', () {
      expect(() => ApiFilterConfig(FilterConditionType.contains, 'sub', 'field'), returnsNormally);
      expect(() => ApiFilterConfig(FilterConditionType.contains, 789, 'field'), throwsFormatException);
    });

    test('matches requires String value', () {
      expect(() => ApiFilterConfig(FilterConditionType.matches, r'\d+', 'field'), returnsNormally);
      expect(() => ApiFilterConfig(FilterConditionType.matches, {}, 'field'), throwsFormatException);
    });

    test('greaterThan requires numeric value', () {
      expect(() => ApiFilterConfig(FilterConditionType.greaterThan, 10, 'field'), returnsNormally);
      expect(() => ApiFilterConfig(FilterConditionType.greaterThan, '10', 'field'), throwsFormatException);
    });

    test('greaterThanOrEqual requires numeric value', () {
      expect(() => ApiFilterConfig(FilterConditionType.greaterThanOrEqual, 20.5, 'field'), returnsNormally);
      expect(() => ApiFilterConfig(FilterConditionType.greaterThanOrEqual, null, 'field'), throwsFormatException);
    });

    test('lessThan requires numeric value', () {
      expect(() => ApiFilterConfig(FilterConditionType.lessThan, 5, 'field'), returnsNormally);
      expect(() => ApiFilterConfig(FilterConditionType.lessThan, '5', 'field'), throwsFormatException);
    });

    test('lessThanOrEqual requires numeric value', () {
      expect(() => ApiFilterConfig(FilterConditionType.lessThanOrEqual, 15, 'field'), returnsNormally);
      expect(() => ApiFilterConfig(FilterConditionType.lessThanOrEqual, [], 'field'), throwsFormatException);
    });

    test('between requires Iterable of length 2 with numeric values', () {
      expect(() => ApiFilterConfig(FilterConditionType.between, [1, 2], 'field'), returnsNormally);
      expect(() => ApiFilterConfig(FilterConditionType.between, [1], 'field'), throwsFormatException);
      expect(() => ApiFilterConfig(FilterConditionType.between, ['a', 'b'], 'field'), throwsFormatException);
    });

    test('containsAll requires Iterable', () {
      expect(() => ApiFilterConfig(FilterConditionType.containsAll, ['a', 'b'], 'field'), returnsNormally);
      expect(() => ApiFilterConfig(FilterConditionType.containsAll, 'not iterable', 'field'), throwsFormatException);
    });

    test('containsAny requires Iterable', () {
      expect(() => ApiFilterConfig(FilterConditionType.containsAny, ['a', 'b'], 'field'), returnsNormally);
      expect(() => ApiFilterConfig(FilterConditionType.containsAny, 123, 'field'), throwsFormatException);
    });

    test('inList requires Iterable', () {
      expect(() => ApiFilterConfig(FilterConditionType.inList, [1, 2, 3], 'field'), returnsNormally);
      expect(() => ApiFilterConfig(FilterConditionType.inList, {}, 'field'), throwsFormatException);
    });

    test('notInList requires Iterable', () {
      expect(() => ApiFilterConfig(FilterConditionType.notInList, [1, 2], 'field'), returnsNormally);
      expect(() => ApiFilterConfig(FilterConditionType.notInList, null, 'field'), throwsFormatException);
    });

    test('isNull requires null value', () {
      expect(() => ApiFilterConfig(FilterConditionType.isNull, null, 'field'), returnsNormally);
      expect(() => ApiFilterConfig(FilterConditionType.isNull, 'not null', 'field'), throwsFormatException);
    });

    test('isNotNull requires null value', () {
      expect(() => ApiFilterConfig(FilterConditionType.isNotNull, null, 'field'), returnsNormally);
      expect(() => ApiFilterConfig(FilterConditionType.isNotNull, 123, 'field'), throwsFormatException);
    });

    test('exists requires bool or null value', () {
      expect(() => ApiFilterConfig(FilterConditionType.exists, true, 'field'), returnsNormally);
      expect(() => ApiFilterConfig(FilterConditionType.exists, false, 'field'), returnsNormally);
      expect(() => ApiFilterConfig(FilterConditionType.exists, null, 'field'), returnsNormally);
      expect(() => ApiFilterConfig(FilterConditionType.exists, 'true', 'field'), throwsFormatException);
    });
  });

}
