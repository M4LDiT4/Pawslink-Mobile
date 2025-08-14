import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app_template/network/operation_response.dart';

void main() {
  group('OperationResponse', () {
    test('parses Dio response with valid JSON map', () {
      final dioResponse = Response(
        data: jsonEncode({
          'statusCode': 200,
          'success': true,
          'message': 'OK',
          'data': {'id': 1, 'name': 'John'}
        }),
        statusCode: 200,
        requestOptions: RequestOptions(path: '/test'),
      );

      final result = OperationResponse<Map<String, dynamic>>.fromDioResponse(
        dioResponse,
        parser: (data) => data as Map<String, dynamic>,
      );

      expect(result.isSuccessful, isTrue);
      expect(result.statusCode, 200);
      expect(result.message, equals('OK'));
      expect(result.data, isA<Map<String, dynamic>>());
      expect(result.data?['id'], equals(1));
      expect(result.data?['name'], equals('John'));
    });

    test('parses Dio response when data is not a Map', () {
      final dioResponse = Response(
        data: jsonEncode(['apple', 'banana']),
        statusCode: 200,
        requestOptions: RequestOptions(path: '/test'),
      );

      final result = OperationResponse<List<String>>.fromDioResponse(
        dioResponse,
        parser: (data) => List<String>.from(data),
      );

      expect(result.isSuccessful, isTrue);
      expect(result.statusCode, 200);
      expect(result.data, equals(['apple', 'banana']));
    });

    test('returns nullResponse when dio data is null', () {
      final dioResponse = Response(
        data: null,
        statusCode: 500,
        requestOptions: RequestOptions(path: '/test'),
      );

      final result = OperationResponse<String>.fromDioResponse(
        dioResponse,
        parser: (data) => data.toString(),
      );

      expect(result.isSuccessful, isFalse);
      expect(result.statusCode, 500);
      expect(result.data, isNull);
      expect(result.message, contains('null'));
    });

    test('handles invalid JSON in dio response', () {
      final dioResponse = Response(
        data: 'not-a-json',
        statusCode: 400,
        requestOptions: RequestOptions(path: '/test'),
      );

      final result = OperationResponse<String>.fromDioResponse(
        dioResponse,
        parser: (data) => data.toString(),
      );

      expect(result.isSuccessful, isFalse);
      expect(result.data, isNull);
      expect(result.message, equals('No message provided'));
    });

    test('nullResponse factory creates expected object', () {
      final result = OperationResponse<String>.nullResponse(
        message: 'No data',
        isSuccessful: false,
        statusCode: 404,
      );

      expect(result.isSuccessful, isFalse);
      expect(result.statusCode, 404);
      expect(result.message, equals('No data'));
      expect(result.data, isNull);
    });

    test('failedResponse factory creates expected object', () {
      final result = OperationResponse.failedResponse(
        message: 'Something went wrong',
        statusCode: 500,
      );

      expect(result.isSuccessful, isFalse);
      expect(result.statusCode, 500);
      expect(result.message, equals('Something went wrong'));
    });

    test('successfulResponse factory creates expected object', () {
      final result = OperationResponse.successfulResponse(
        message: 'All good',
        statusCode: 201,
      );

      expect(result.isSuccessful, isTrue);
      expect(result.statusCode, 201);
      expect(result.message, equals('All good'));
    });

    test('listParser parses valid items', () {
      final list = ['1', '2', '3'];

      final parsedList = OperationResponse.listParser<int>(
        list,
        itemParser: (item) => int.parse(item),
      );

      expect(parsedList, equals([1, 2, 3]));
    });

    test('listParser skips invalid items', () {
      final list = ['1', 'two', '3'];

      final parsedList = OperationResponse.listParser<int>(
        list,
        itemParser: (item) => int.parse(item),
      );

      expect(parsedList, equals([1, 3])); // 'two' is skipped
    });
  });
}
