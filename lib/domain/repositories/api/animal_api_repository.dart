
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';
import 'package:mobile_app_template/domain/entities/animal_dto.dart';
import 'package:mobile_app_template/domain/repositories/api/api_filter_config.dart';
import 'package:mobile_app_template/domain/repositories/api/api_sort_config.dart';
import 'package:mobile_app_template/network/multipart_file_data.dart';
import 'package:mobile_app_template/network/network_client.dart';
import 'package:mobile_app_template/network/operation_response.dart';

class AnimalApiRepository {
  NetworkClient? _client;
  Uri? _baseUrl;
  final String _basePath = "animal-database";
  final String _addAnimalPath = "animal";
  final String _getAnimalPath = 'animal';

  AnimalApiRepository._internal();

  static final AnimalApiRepository _instance = AnimalApiRepository._internal();

  factory AnimalApiRepository() => _instance;

  void init(NetworkClient client){
    // make sure not to re-initialize network client
    if(_client != null) return; 
    final backendUrl = dotenv.env['BACKEND_URL'];
    // throw error if .env file has no link for the backend url
    if (backendUrl == null) throw  Exception("Missing Animal Api Configuration");
    // initialize client
    _client = client;
    // initialize the base url
    _baseUrl = Uri.parse('$backendUrl$_basePath');
  }

  Future<OperationResponse<AnimalDTO>> addAnimal(AnimalDTO animal, {File? profilePicture}) async{
    try{
      _checkIfPreConditionValid();
      final savedAnimal = await _client!.post<AnimalDTO>(
        "${_baseUrl!.path}/$_addAnimalPath", 
        dataParser: (item) => AnimalDTO.fromMap(item),
        fields: animal.toMap(),
        files: profilePicture != null? [
          MultipartFileData(fieldName: 'image', filePath: profilePicture.path)
        ]: []
      );
      return savedAnimal;
    }catch(err, stack){
      TLogger.error("Add animal operation failed: ${err.toString()}");
      TLogger.info("Stack : ${stack.toString()}");
      return OperationResponse<AnimalDTO>.failedResponse(
        message: "An Exception occured while saving ${animal.name} to the database"
      );
    }
  } 

  Future<OperationResponse<List<AnimalDTO>>> getAnimals ({
    int page = 1,
    int limit = 50,
    bool? all = false,
    ApiSortConfig? sortConfig,
    ApiFilterConfig? filterConfig,
  }) async {
    try{
      Map<String, dynamic> queryParameters ={};

      queryParameters['sortConfig'] = sortConfig?.toMap();

      queryParameters['filterBy'] = filterConfig?.field ?? ApiSortConfig.withDefaults().toMap();
      queryParameters['filterCondition'] = filterConfig?.condition.name;
      queryParameters['filterValue'] = filterConfig?.condition.toString();
      queryParameters['page'] = page;
      queryParameters['limit'] = limit;
      
      final response = await _client!.get<List<AnimalDTO>>(
        "${_baseUrl.toString()}$_getAnimalPath", 
        dataParser: (item) => OperationResponse.listParser(
          item, 
          itemParser: (item) => AnimalDTO.fromMap(item)
        ),
        queryParameters: queryParameters
      );
      return response;
    }catch(err, stack){
      TLogger.error("Get animal operation failed: ${err.toString()}");
      TLogger.info("StacK:\n${stack.toString()}");
      return OperationResponse.failedResponse(
        message: "An Exception occured while getting animals"
      );
    }
  }

  
  /// Checks if the service is properly initialized
  /// ### Throws
  /// An [Exception] if service is not properly initialized
  void _checkIfPreConditionValid(){
    //pre: _client and _baseUrl should not be null
    if(_client == null || _baseUrl == null){
      throw Exception("Animal Service is not initialized, initialize using the `init` method");
    }
  }

}