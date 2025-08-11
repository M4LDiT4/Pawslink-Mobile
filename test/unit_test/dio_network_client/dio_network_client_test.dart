import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app_template/network/dio/dio_network_client.dart';
import 'package:mobile_app_template/network/operation_response.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'dio_network_client_test.mocks.dart';

@GenerateMocks([Dio])

void main() {
  late MockDio mockDio;
  late DioNetworkClient dioClient;

  setUp(() {
    mockDio = MockDio();
    dioClient = DioNetworkClient(mockDio);
  });

  group('DioNetworkClient Tests', () {
    test('✅ Initialization should store Dio instance', () {
      expect(dioClient, isNotNull);
    });

    test('✅ GET request - successful response', () async {
      final mockResponse = Response(
        requestOptions: RequestOptions(path: '/test'),
        data: {"message": "success"},
        statusCode: 200,
      );

      when(mockDio.get(
        '/test',
        data: anyNamed('data'),
        queryParameters: anyNamed('queryParameters'),
        options: anyNamed('options'),
        cancelToken: anyNamed('cancelToken'),
        onReceiveProgress: anyNamed('onReceiveProgress')
      )).thenAnswer((_) async => mockResponse);

      final result = await dioClient.get('/test');

      expect(result, isA<OperationResponse>());
      expect(result.statusCode, equals(200));
      expect(result.message, equals('success'));
    });

    test('✅ GET request - throws DioError', () async {
      when(mockDio.get(
        '/error',
        data: anyNamed('data'),
        queryParameters: anyNamed('queryParameters'),
        options: anyNamed('options'),
        cancelToken: anyNamed('cancelToken'),
        onReceiveProgress: anyNamed('onReceiveProgress')
      )).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/error'),
          type: DioExceptionType.badResponse,
          response: Response(
            requestOptions: RequestOptions(path: '/error'),
            statusCode: 500,
            data: {'error': 'Server error'},
          ),
        ),
      );

      final result = await dioClient.get('/error');

      expect(result, isA<OperationResponse>());
      expect(result.statusCode, equals(500));
      expect(result.message, equals('Server error'));
    });

    test('✅ POST request - successful', () async {
      final mockResponse = Response(
        requestOptions: RequestOptions(path: '/post'),
        data: {
          'data': {'id': 1}
        },
        statusCode: 201,
      );

      when(mockDio.request(
        '/post', 
        data:anyNamed('data'),
        queryParameters: anyNamed('queryParameters'),
        options: anyNamed('options'),
        cancelToken: anyNamed('cancelToken'),
        onReceiveProgress: anyNamed('onReceiveProgress'),
        onSendProgress: anyNamed('onSendProgress')
        ))
          .thenAnswer((_) async => mockResponse);

      final result = await dioClient.post('/post', fields: {'name': 'John'});

      expect(result.statusCode, equals(201));
      expect(result.data['id'], equals(1));
    });

    test('✅ Timeout should return proper error', () async {
      when(mockDio.get(
          '/timeout',
          data: anyNamed('data'),
          queryParameters: anyNamed('queryParameters'),
          options: anyNamed('options'),
          cancelToken: anyNamed('cancelToken'),
          onReceiveProgress: anyNamed('onReceiveProgress')
        )).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/timeout'),
          type: DioExceptionType.connectionTimeout,
        ),
      );

      final result = await dioClient.get('/timeout');

      expect(result.statusCode, equals(408)); // or whatever you set for timeout
      expect(result.data, isNull);
    });

    test('✅ Check custom headers are sent', () async {
      final headers = {'Authorization': 'Bearer token123'};

      when(mockDio.get(
        any,
        data: anyNamed('data'),
        queryParameters: anyNamed('queryParameters'),
        options: anyNamed('options'),
        cancelToken: anyNamed('cancelToken'),
        onReceiveProgress: anyNamed('onReceiveProgress'),
      )).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: '/secure'),
            statusCode: 200,
            data: {'data': {'ok': true}},
          ));

      await dioClient.get('/secure', headers: headers);

      verify(mockDio.get(
        '/secure',
        options: argThat(
          predicate((Options opts) =>
              opts.headers?['Authorization'] == 'Bearer token123'),
          named: 'options',
        ),
        data: anyNamed('data'),
        queryParameters: anyNamed('queryParameters'),
        cancelToken: anyNamed('cancelToken'),
        onReceiveProgress: anyNamed('onReceiveProgress'),
      )).called(1);
    });

    test('✅ Handle empty data in response', () async {
      when(mockDio.get('/empty')).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: '/empty'),
            statusCode: 200,
            data: null,
          ));

      final result = await dioClient.get('/empty');
      expect(result.data, isNull);
      expect(result.statusCode, equals(200));
    });

    test('✅ Query parameters are passed correctly', () async {
      final queryParams = {'page': 1, 'limit': 10};

      when(mockDio.get(
        any, // matcher for positional arg 'path'
        data: anyNamed('data'),
        queryParameters: anyNamed('queryParameters'),
        options: anyNamed('options'),
        cancelToken: anyNamed('cancelToken'),
        onReceiveProgress: anyNamed('onReceiveProgress'),
      )).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: '/list'),
            statusCode: 200,
            data: [],
          ));

      await dioClient.get('/list', queryParameters: queryParams);

      verify(mockDio.get(
        any, // matcher for positional arg 'path'
        data: anyNamed('data'),
        queryParameters: argThat(
          predicate((Map<String, dynamic> params) =>
              params['page'] == 1 && params['limit'] == 10),
          named: 'queryParameters',
        ),
        options: anyNamed('options'),
        cancelToken: anyNamed('cancelToken'),
        onReceiveProgress: anyNamed('onReceiveProgress'),
      )).called(1);
    });

    test('✅ POST request sends fields correctly', () async {
      final fields = {'username': 'testuser', 'password': 'secret'};

      when(mockDio.request(
        any, // matcher for positional path argument
        data: anyNamed('data'), // matcher for data (fields)
        queryParameters: anyNamed('queryParameters'),
        options: anyNamed('options'),
        cancelToken: anyNamed('cancelToken'),
        onSendProgress: anyNamed('onSendProgress'),
        onReceiveProgress: anyNamed('onReceiveProgress'),
      )).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: '/login'),
            statusCode: 200,
            data: {'success': true},
          ));

        final result = await dioClient.post('/login', fields: fields);

        verify(mockDio.request(
          any, // matcher for positional path argument
          data: argThat(
            predicate((String json){
             final parsedJson = jsonDecode(json);
             if(parsedJson is Map){
              return parsedJson['username'] == 'testuser' && 
              parsedJson['password'] == 'secret';
             }
             return false;
            }),
              named: 'data'
          ),
          queryParameters: anyNamed('queryParameters'),
          options: anyNamed('options'),
          cancelToken: anyNamed('cancelToken'),
          onSendProgress: anyNamed('onSendProgress'),
          onReceiveProgress: anyNamed('onReceiveProgress'),
        )).called(1);

        expect(result.isSuccessful, true);
      });

  });
}