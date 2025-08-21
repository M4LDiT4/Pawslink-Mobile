import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';

class OperationResponse<T> {
  bool isSuccessful;
  String? message;
  T? data;
  int statusCode;

  /// Generic constructor
  OperationResponse({
    required this.isSuccessful,
    required this.statusCode,
    this.data,
    this.message
  });

  /// Constructs a new [OperationResponse] from a dio [Response]
  /// ### Parameters
  /// - **[response]**: a dio [Response] object that will be used to construct the new [OperationResponse]
  /// - **[parser]** : a function that parses the `data` field of the dio response
  /// ### Returns
  /// A [OperationResponse] object that reprensents the processed data from the response of the request
  /// 
  /// ### Notes
  /// - This parser-constructor assumes that the `data` field can be parsed directly by the `parser` function
  /// - If [response.data] is an instance of [Map], it assumes that the data is stored in the `targetField` field 
  factory OperationResponse.fromDioResponse(
    Response response,
    {
      required  Function(dynamic) parser,
      String targetField = "data"
    }
  ){
    TLogger.info(response.toString());
    final data = response.data;
    if(data == null){
      return OperationResponse.nullResponse(
        statusCode: response.statusCode,
        message: 'Dio response is null',
        isSuccessful: _reqSuccessByStatuscode(response.statusCode) ?? false 
      );
    }
    T? parsedData;
    String? message;
    int? statusCode;
    bool? success;
    try{
      // if data is string, decode as json, otherwise retain
      final jsonData = data is String? jsonDecode(data): data;
      //if jsonData is map, these are the assumptions
      //jsonData
      //  -may or may not have a message or error field
      //  -may or may not have a statusCode field
      //  -may or may not have a success field
      //  -may nor may not have a field defined by `targetField`
      // Note
      //  -assumes that response data is in the `targetField` key
      if(jsonData is Map<String, dynamic>){
        message = jsonData['message'] ?? jsonData['error'];
        statusCode = jsonData["statusCode"];
        success = jsonData['success'];
        parsedData = parser(jsonData[targetField]);
      }else{
        parsedData = parser(jsonData);
      }
    }catch(err, stack){
      TLogger.error("Failed to parse dio Response to Operation Response: ${err.toString()}");
      TLogger.debug("Stack: ${stack.toString()}");
      parsedData = null;
    }

    return OperationResponse(
      isSuccessful: _reqSuccessByStatuscode(response.statusCode) 
        ?? _reqSuccessByStatuscode(statusCode) 
        ??success 
        ?? false
      ,
      statusCode: response.statusCode ?? statusCode ?? 400,
      data: parsedData,
      message: message
    );
    
  }

  factory OperationResponse.nullResponse({
    String? message,
    bool? isSuccessful,
    int? statusCode
  }){
    return OperationResponse(
      isSuccessful: isSuccessful?? false , 
      statusCode: statusCode ?? 400,
      data: null,
      message: message?? 'No response provided'
    );
  }

  factory OperationResponse.failedResponse({
    String? message,
    int? statusCode,
  }) => OperationResponse(isSuccessful: false, statusCode: statusCode?? 400, message: message ?? "Operation Failed");


  factory OperationResponse.successfulResponse({
    String? message,
    int? statusCode
  }) => OperationResponse(isSuccessful: true, statusCode: statusCode ?? 200, message: message ?? "Operation Successful");

  /// Check if response is successful or not by using statusCode
  static bool? _reqSuccessByStatuscode(int? statusCode){
    if(statusCode == null){
      return null;
    }
    return statusCode >= 200 && statusCode < 300;
  }

  ///Utility function for parsing json lists. 
  /// ### Parameters
  /// - **[list]**: [List] of values from a JSON
  /// - **[itemParser]** : function that parses **item** on the list
  /// 
  /// ### Return
  /// [List] of [T] objects
  /// 
  /// ### Notes
  /// - use this to simplify parsing logic for data of type [List]
  static List<T> listParser<T>(
    List<dynamic> list,
    {
      required T Function(dynamic) itemParser
    }
    ){
    //pre: list is already parsed using jsonDecode
    //post: returns a list of T elements
    final itemList = <T>[];
    //returned only items on the list that can be parsed using the parser function
    for(var i = 0; i < list.length; i++){
      try{
        itemList.add(itemParser(list[i]));
      }catch(err){
        TLogger.warning("Failed to parse ${list[i].toString()} ${err.toString()}");
      }
    }
    return itemList;
  }
}