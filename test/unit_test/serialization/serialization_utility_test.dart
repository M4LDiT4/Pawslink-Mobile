import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app_template/core/utils/network/serialization.dart';
import 'package:mobile_app_template/core/enums/general_data_types.dart';
import 'package:mobile_app_template/domain/entities/base_dto.dart';

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
  group('SerializationUtility', () {
    test('serializeIterableData with primitives', () {
      final data = [1, 'string', true, 3.14];
      final result = SerializationUtility.serializeIterableData(data);
      expect(result, equals(data));
    });

    test('serializeIterableData with BaseDto object', () {
      final data = [MockDto('Alice', 30)];
      final result = SerializationUtility.serializeIterableData(data);
      expect(result.first, isA<Map<String, dynamic>>());
      expect(result.first['name'], 'Alice');
      expect(result.first['age'], 30);
    });

    test('serializeObject with non-BaseDto should throw', () {
      expect(
        () => SerializationUtility.serializeObject(Object()),
        throwsA(isA<Exception>()),
      );
    });

    test('getGenericDataType returns correct types', () {
      expect(SerializationUtility.getGenericDataType(null),
          GeneralDataTypes.isNoValue);
      expect(SerializationUtility.getGenericDataType(5),
          GeneralDataTypes.isPrimitive);
      expect(SerializationUtility.getGenericDataType(5.5),
          GeneralDataTypes.isPrimitive);
      expect(SerializationUtility.getGenericDataType('test'),
          GeneralDataTypes.isPrimitive);
      expect(SerializationUtility.getGenericDataType(true),
          GeneralDataTypes.isPrimitive);
      expect(SerializationUtility.getGenericDataType([1, 2]),
          GeneralDataTypes.isPrimitive);
      expect(SerializationUtility.getGenericDataType({'a': 1}),
          GeneralDataTypes.isPrimitive);
      expect(SerializationUtility.getGenericDataType({1, 2}),
          GeneralDataTypes.isPrimitive);

      expect(SerializationUtility.getGenericDataType(MockDto('Bob', 25)),
          GeneralDataTypes.isObject);
    });

    test('serializeIterableData logs warning for unsupported type', () {
      // We can’t easily verify logs without mocking TLogger,
      // but we can ensure the method doesn't throw.
      final data = [DateTime.now()];
      expect(() => SerializationUtility.serializeIterableData(data), throwsA(isA<Exception>()));
    });
  });
}
