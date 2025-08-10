import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';
import 'package:mobile_app_template/network/operation_response.dart';

void main() {
  group('OperationResponse', () {

    test('fromDioResponse returns successful OperationResponse when status code 200 and valid data', () {
      final responseData = jsonEncode({
        'message': 'Success message',
        'statusCode': 200,
        'success': true,
        'data': {'key': 'value'}
      });
      final dioResponse = Response(
        data: responseData,
        statusCode: 200,
        requestOptions: RequestOptions(path: '/test'),
      );

      final result = OperationResponse<Map<String, dynamic>>.fromDioResponse(
        dioResponse,
        parser: (json) {
          TLogger.info(json.toString());
          return json as Map<String, dynamic>;
        },
      );

      expect(result.isSuccessful, true);
      expect(result.statusCode, 200);
      expect(result.message, 'Success message');
      expect(result.data, isA<Map<String, dynamic>>());
      expect(result.data!['key'], 'value');
    });

    test("fromDioResponse returns successful OperationResponse when status code 200 and data is list", (){
      final intList = [1, 2, 3];
      final dioResponse = Response(
        data: jsonEncode(intList),
        statusCode: 200,
        requestOptions: RequestOptions(path: '/test')
      ); 

      final result = OperationResponse<List<int>>.fromDioResponse(
        dioResponse, 
        parser: (list){
          TLogger.info("Runtime type: ${list.runtimeType.toString()}");
          if (list is List) {
            try {
              final jsonList = <int>[];
              jsonList.addAll(
                list.map((item){
                  if(item is int){
                    return item;
                  }
                  if(item is String){
                    final parsedNum = int.tryParse(item);
                    if(parsedNum == null){
                      throw  FormatException("$item is not a valid numeric string");
                    }
                    return parsedNum;
                  }
                  throw FormatException("$item is not a valid number or numeric string");
                }).toList()
              );
              return jsonList;
            } catch (e) {
              TLogger.error(e.toString());
              rethrow;
            }
          }
          return <int>[];
        }
      );

      expect(result.isSuccessful, true);
      expect(result.statusCode, 200);
      expect(result.data, isA<List<int>>());
      expect(result.data, equals([1, 2, 3]));
    });

    test('fromDioResponse returns failed OperationResponse when status code 400 and error message', () {
      final responseData = jsonEncode({
        'error': 'Some error occurred',
        'statusCode': 400,
        'success': false,
      });
      final dioResponse = Response(
        data: responseData,
        statusCode: 400,
        requestOptions: RequestOptions(path: '/test'),
      );

      final result = OperationResponse<dynamic>.fromDioResponse(
        dioResponse,
        parser: (json) => json,
      );

      expect(result.isSuccessful, false);
      expect(result.statusCode, 400);
      expect(result.message, 'Some error occurred');
      expect(result.data, null);
    });

    test('fromDioResponse returns nullResponse when response data is null', () {
      final dioResponse = Response(
        data: null,
        statusCode: 204,
        requestOptions: RequestOptions(path: '/test'),
      );

      final result = OperationResponse<dynamic>.fromDioResponse(
        dioResponse,
        parser: (json) => json,
      );

      expect(result.isSuccessful, true);
      expect(result.statusCode, 204);
      expect(result.message, 'Dio response is null');
      expect(result.data, null);
    });

    test('nullResponse factory creates an OperationResponse with default values', () {
      final response = OperationResponse.nullResponse();

      expect(response.isSuccessful, false);
      expect(response.statusCode, 400);
      expect(response.message, 'No response provided');
      expect(response.data, null);
    });

    test('failedResponse factory creates an OperationResponse with false isSuccessful', () {
      final response = OperationResponse.failedResponse(message: 'Failure', statusCode: 500);

      expect(response.isSuccessful, false);
      expect(response.statusCode, 500);
      expect(response.message, 'Failure');
    });

    test('successfulResponse factory creates an OperationResponse with true isSuccessful', () {
      final response = OperationResponse.successfulResponse(message: 'Success', statusCode: 201);

      expect(response.isSuccessful, true);
      expect(response.statusCode, 201);
      expect(response.message, 'Success');
    });
  });
}
