import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app_template/core/enums/filter_condition_type.dart';
import 'package:mobile_app_template/domain/entities/base_dto.dart';
import 'package:mobile_app_template/domain/services/api/api_filter_config.dart';

class MockLocalData {
  final String name;
  final int age;

  MockLocalData(this.name, this.age);
}

// Mock BaseDto implementation
class MockDto extends BaseDto {
  final String name;
  final int age;

  MockDto(this.name, this.age);

  @override
  MockLocalData toLocalModel(){
    return MockLocalData(name, age);
  }
  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
    };
  }
}

void main() {
  group('ApiFilterConfig.toMap', () {
    test('serializes primitive value', () {
      final config = ApiFilterConfig.equals('species', 'cat');
      final result = config.toMap();

      expect(result['field'], 'species');
      expect(result['condition'], FilterConditionType.equals.toString());
      expect(result['value'], 'cat');
    });

    test('serializes iterable value', () {
      final config = ApiFilterConfig.inList('species', ['cat', 'dog']);
      final result = config.toMap();

      expect(result['field'], 'species');
      expect(result['condition'], FilterConditionType.inList.toString());
      expect(result['value'], ['cat', 'dog']); // still a List after serialization
    });

    test('serializes null value', () {
      final config = ApiFilterConfig.isNull('deletedAt');
      final result = config.toMap();

      expect(result['field'], 'deletedAt');
      expect(result['condition'], FilterConditionType.isNull.toString());
      expect(result['value'], isNull);
    });

    test('serializes object value', () {
      final mock = MockDto('Alice', 30);
      final config = ApiFilterConfig.equals('owner', mock);
      final result = config.toMap();

      expect(result['field'], 'owner');
      expect(result['condition'], FilterConditionType.equals.toString());
      expect(result['value'], {'name': 'Alice', 'age': 30});
    });
  });
}
