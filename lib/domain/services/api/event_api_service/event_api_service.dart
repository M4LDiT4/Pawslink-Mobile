
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';
import 'package:mobile_app_template/domain/entities/event_dto.dart';
import 'package:mobile_app_template/domain/repositories/api/api_filter_config.dart';
import 'package:mobile_app_template/domain/repositories/api/api_sort_config.dart';
import 'package:mobile_app_template/network/multipart_file_data.dart';
import 'package:mobile_app_template/network/network_client.dart';
import 'package:mobile_app_template/network/operation_response.dart';

class EventApiService {
  NetworkClient? _client;
  Uri? _baseUrl;
  final String _basePath = "events"; //check the backend if this is correct
  final String _addEventPath = "event";
  final String _getEventPath = "event";

  EventApiService._internal();

  static final EventApiService _instance = EventApiService._internal();

  factory EventApiService () => _instance;

  void init(NetworkClient client){
    if(_client != null) return;

    final backendUrl = dotenv.env['BACKEND_URL'];

    if(backendUrl == null) throw Exception("Missing Event Api Configuration");

    _client = client;
    _baseUrl = Uri.parse('$backendUrl$_basePath');
  }

  void _checkIfPreConditionValid(){
    if(_client == null || _baseUrl == null){
      throw Exception("Animal Service is not initialized, initialize using the `init` method");
    }
  }

  Future<OperationResponse<EventDTO>> addEvent(
    EventDTO event,
    {
      File? eventImage
    }
  )async{
    try{
      _checkIfPreConditionValid();

      final savedEvent = await _client!.post(
        "${_baseUrl!.path}/$_addEventPath", 
        fields: event.toMap(),
        files: eventImage != null?
          [
            MultipartFileData(fieldName: 'image', filePath: eventImage.path)
          ]: [],
        dataParser: (data) => EventDTO.fromMap(data)
      ); 
      return savedEvent;
    }catch(err, stack){
      TLogger.error("Add event operation failed: ${err.toString()}");
      TLogger.info("Stack: \n ${stack.toString()}");
      return OperationResponse.failedResponse(
        message: "An exception occured while saving ${event.eventName} to database"
      );
    }
  }

  Future<OperationResponse<List<EventDTO>>> getEvents({
    int page = 1,
    int limit = 50,
    bool? all = false,
    ApiSortConfig? sortConfig,
    ApiFilterConfig? filterConfig
  }) async{
    try{
      Map<String, dynamic> queryParameters = {};

      queryParameters['sortConfig'] = sortConfig?.toMap();
      queryParameters['filterConfig'] = filterConfig?.toMap();
      queryParameters['page'] = page;
      queryParameters['limit'] = limit;

      final response = await _client!.get(
        "${_baseUrl.toString()}$_getEventPath", 
        dataParser: (item) => OperationResponse.listParser(
          item,
          itemParser: (item) => EventDTO.fromMap(item)
        ),
        queryParameters: queryParameters
      );

      return response;
    }catch(err, stack){
      TLogger.error("Get event operation failed: ${err.toString()}");
      TLogger.debug("Stack: \n ${stack.toString()}");
      return OperationResponse.failedResponse(
        message: "An exception occured while getting events"
      );
    }
  }

}