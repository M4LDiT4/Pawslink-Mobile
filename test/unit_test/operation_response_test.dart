
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app_template/network/operation_response.dart';

void main(){
  group('Operation Response: List Parser', () {
    
    test("listParser successfully parses an empty list", (){
      final response = jsonEncode({
        'data': []
      });

      final data = jsonDecode(response);

      final result = OperationResponse.listParser<int>(
        data['data'], 
        itemParser: (item) => item as int
      );

      expect(result, equals([]));
    });

    test('listParser parses only valid items on list', (){
      final response = jsonEncode({
        'data': [4, 6, 'int']
      });

      final data = jsonDecode(response);

      final result = OperationResponse.listParser<int>(
        data['data'], 
        itemParser: (item) => item as int
      );

      expect(result, equals([4, 6]));
    });

  });
}