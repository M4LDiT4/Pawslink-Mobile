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
  final String _updates = "update";
  final String _checkUpdates = "check-update";

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
      final base = _baseUrl!;
      final url = Uri(
        scheme: base.scheme,
        port: base.port,
        host: base.host,
        path: '${base.path}/$_addAnimalPath'
      );
      _checkIfPreConditionValid();
      final savedAnimal = await _client!.post<AnimalDTO>(
        url.toString(), 
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

  Future<List<AnimalDTO>>getUpdates(DateTime? time)async{
    try{
      _checkIfPreConditionValid();
      final base = _baseUrl!;
      final url = Uri(
        host: base.host,
        scheme: base.scheme,
        port: base.port,
        path: time != null 
          ? "${base.path}/$_updates/${time.toIso8601String()}"
          : "${base.path}/$_updates/"
      );
      final response = await _client!.get<List<AnimalDTO>>(
        url.toString(),
        dataParser: (items) => OperationResponse.listParser(
          items,
          itemParser: (el) => AnimalDTO.fromMap(el)
        )
      );
      if(!response.isSuccessful || response.data == null){
        throw Exception("Getting updates for animals, status: ${response.isSuccessful}, data: ${response.data}");
      }
      return response.data!;
    }catch(err){
      TLogger.error("Failed to get the updates for animals ${err.toString()}");
      return [];
    }
  }

  Future<int> checkIfUpdatesAvailable(DateTime? time) async {
    try{
      _checkIfPreConditionValid();
      final base = _baseUrl!;
      final url = Uri(
        host: base.host,
        scheme: base.scheme,
        port: base.port,
        path: time != null 
          ? "${base.path}/$_checkUpdates`/${time.toIso8601String()}"
          : "${base.path}/$_checkUpdates/"
      );
      final response = await _client!.get(
        url.toString(), 
        dataParser: (item) => item as int
      );

      if(response.data == null){
        throw Exception("Failed to check for updates");
      }
      return response.data!;
    }catch(err){
      TLogger.error("API level failed to check for updates: ${err.toString()}");
      return 0;
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