import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart' as dio;
import 'package:mobile_app_template/network/response.dart';

// Mock custom object for parsing
class CustomObject {
  final String name;
  final int age;

  CustomObject({required this.name, required this.age});

  factory CustomObject.fromJson(Map<String, dynamic> json) {
    return CustomObject(
      name: json['name'] as String,
      age: json['age'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomObject &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          age == other.age;

  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}

void main() {
  group('TResponse Tests', () {
    test('fromDioResponse - success case', () {
      final responseData = jsonEncode({'name': 'John', 'age': 25});
      final dioResponse = dio.Response(
        requestOptions: dio.RequestOptions(path: ''),
        data: responseData,
        statusCode: 200,
      );

      final result = TResponse<CustomObject>.fromDioResponse(
        dioResponse,
        parser: (data) => CustomObject.fromJson(data),
      );

      expect(result.isSuccessful, true);
      expect(result.data, CustomObject(name: 'John', age: 25));
    });

    test('fromDioResponse - null data', () {
      final dioResponse = dio.Response(
        requestOptions: dio.RequestOptions(path: ''),
        data: null,
        statusCode: 200,
      );

      final result = TResponse<CustomObject>.fromDioResponse(
        dioResponse,
        parser: (data) => CustomObject.fromJson(data),
      );

      expect(result.isSuccessful, true);
      expect(result.data, null);
      expect(result.message, 'Dio Null Response');
    });

    test('fromDioResponse - parsing failure', () {
      final invalidJson = jsonEncode({'unexpected': 'field'});
      final dioResponse = dio.Response(
        requestOptions: dio.RequestOptions(path: ''),
        data: invalidJson,
        statusCode: 200,
      );

      final result = TResponse<CustomObject>.fromDioResponse(
        dioResponse,
        parser: (data) => throw Exception("Parse error"),
      );

      expect(result.data, null);
      expect(result.isSuccessful, true);
    });

    test('successful factory', () {
      final result = TResponse.successful(message: 'OK', statusCode: 201);
      expect(result.isSuccessful, true);
      expect(result.statusCode, 201);
      expect(result.message, 'OK');
    });

    test('failed factory', () {
      final result = TResponse.failed(message: 'Not Found', statusCode: 404);
      expect(result.isSuccessful, false);
      expect(result.statusCode, 404);
      expect(result.message, 'Not Found');
    });

    test('parseFromJson - success case', () {
      final json = {
        'success': true,
        'statusCode': 200,
        'data': {'name': 'Alice', 'age': 30},
        'message': 'Success'
      };

      final result = TResponse<CustomObject>.parseFromJson(
        json,
        parser: (data) => CustomObject.fromJson(data),
      );

      expect(result.isSuccessful, true);
      expect(result.data, CustomObject(name: 'Alice', age: 30));
    });

    test('parseFromJson - missing data field throws exception', () {
      final json = {'success': true, 'statusCode': 200};
      expect(
        () => TResponse<CustomObject>.parseFromJson(
          json,
          parser: (data) => CustomObject.fromJson(data),
        ),
        throwsFormatException,
      );
    });

    test('nullResponse factory', () {
      final result = TResponse.nullResponse(message: 'Empty');
      expect(result.isSuccessful, false);
      expect(result.message, 'Empty');
    });

    test('toString includes all fields', () {
      final obj = CustomObject(name: 'Test', age: 40);
      final response = TResponse<CustomObject>(
        success: true,
        statusCode: 200,
        message: 'Hello',
        data: obj,
      );
      final str = response.toString();
      expect(str, contains('TResponse<CustomObject>'));
      expect(str, contains('Hello'));
      expect(str, contains('Test'));
    });
  });
}
