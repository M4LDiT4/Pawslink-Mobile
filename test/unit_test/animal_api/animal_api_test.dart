
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app_template/core/enums/animal_sex.dart';
import 'package:mobile_app_template/core/enums/animal_species.dart';
import 'package:mobile_app_template/core/enums/animal_status.dart';
import 'package:mobile_app_template/domain/entities/animal_dto.dart';
import 'package:mobile_app_template/domain/services/api/animal_api_service/animal_api_service.dart';
import 'package:mobile_app_template/network/dio/dio_network_client.dart';
import 'package:mobile_app_template/network/network_client.dart';
import 'package:mobile_app_template/network/operation_response.dart';
import 'package:mockito/mockito.dart';

import '../dio_network_client/dio_network_client_test.mocks.dart';

void main(){
  group('Animal API: add animal', () {
    late MockDio mockDio;
    late AnimalApiService apiService;
    late NetworkClient networkClient;
    setUp(() async {
      await dotenv.load();
      mockDio = MockDio();
      networkClient = DioNetworkClient(mockDio);
      apiService = AnimalApiService();
    });
    test(
      "Not initializing the service throws an error", () async {
        final animal = AnimalDTO(
          name: 'Buddy',
          sex: AnimalSex.male,
          status: AnimalStatus.rainbowBridge,
          species: AnimalSpecies.dog,
          location: 'Shelter A',
        );

        final response = await apiService.addAnimal(animal);

        expect(response, isA<OperationResponse>());
        expect(response.isSuccessful, false);
        expect(response.message, isNotNull);
    });

    test('verify dio.request called with correct data and headers is application/json', () async {
      apiService.init(networkClient);

      final animal = AnimalDTO(
        name: 'Buddy',
        sex: AnimalSex.male,
        status: AnimalStatus.rainbowBridge,
        species: AnimalSpecies.dog,
        location: 'Shelter A',
      );

      when(
        mockDio.request<dynamic>(
          any,
          data: anyNamed('data'),
          queryParameters: anyNamed('queryParameters'),
          cancelToken: anyNamed('cancelToken'),
          options: anyNamed('options'),
          onSendProgress: anyNamed('onSendProgress'),
          onReceiveProgress: anyNamed('onReceiveProgress'),
        ),
      ).thenAnswer((_) async => Response(
            data: {'data': 'ok'},
            statusCode: 200,
            requestOptions: RequestOptions(path: '/test'),
          ));
      // Act
      await apiService.addAnimal(animal);

      // Assert — capture arguments
      final captured = verify(
        mockDio.request<dynamic>(
          captureAny,
          data: captureAnyNamed('data'),
          queryParameters: anyNamed('queryParameters'),
          cancelToken: anyNamed('cancelToken'),
          options: captureAnyNamed('options'),
          onSendProgress: anyNamed('onSendProgress'),
          onReceiveProgress: anyNamed('onReceiveProgress'),
        ),
      ).captured;

      expect(captured[0], '/animal-database/animal'); // Path
      expect(captured[1], jsonEncode(animal.toMap())); // Data
      expect(captured[2].headers?['Content-Type'], 'application/json');
    });
    test('verify dio.request called with correct data, file, and headers is multipart/form-data', () async {
      apiService.init(networkClient);

      final animal = AnimalDTO(
        name: 'Buddy',
        sex: AnimalSex.male,
        status: AnimalStatus.rainbowBridge,
        species: AnimalSpecies.dog,
        location: 'Shelter A',
      );

      when(
        mockDio.request<dynamic>(
          any,
          data: anyNamed('data'),
          queryParameters: anyNamed('queryParameters'),
          cancelToken: anyNamed('cancelToken'),
          options: anyNamed('options'),
          onSendProgress: anyNamed('onSendProgress'),
          onReceiveProgress: anyNamed('onReceiveProgress'),
        ),
      ).thenAnswer((_) async => Response(
            data: {'data': 'ok'},
            statusCode: 200,
            requestOptions: RequestOptions(path: '/test'),
          ));
      // Act
      await apiService.addAnimal(animal);

      // Assert — capture arguments
      final captured = verify(
        mockDio.request<dynamic>(
          captureAny,
          data: captureAnyNamed('data'),
          queryParameters: anyNamed('queryParameters'),
          cancelToken: anyNamed('cancelToken'),
          options: captureAnyNamed('options'),
          onSendProgress: anyNamed('onSendProgress'),
          onReceiveProgress: anyNamed('onReceiveProgress'),
        ),
      ).captured;

      expect(captured[0], '/animal-database/animal'); // Path
      expect(captured[1], jsonEncode(animal.toMap())); // Data
      expect(captured[2].headers?['Content-Type'], 'application/json');
    });
    
  });
}