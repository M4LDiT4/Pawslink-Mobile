///@description : template for creating http requests 
///@note: This is just a template to hollow in creating functions/services that includes http requests

import 'dart:convert';
import 'package:http/http.dart' as http;
class THttpHelper {
  THttpHelper._();
  ///@description : contains the base url for the api
  static const String _baseUrl = "";
  ///@note : you can add additional urls here
  
  ///@description : get request
  ///@args : {String} endpoint -> can be whole url string or endpoint and combine with the baseUrl
  ///@return : {Future<Map<String, dynamic>>} -> a response
  static Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await http.get(Uri.parse(endpoint));
    return _handleResponse(response);
  }

  ///@description : creates a post request
  ///@args : {String} endpoint -> can be whole url string or  an endpoint, then combine with the baseUrl
  ///@args : {dynamic data} -> data to be sent to the api, dynamic for flexibility but you can change the type for type safety
  ///@note : you can expand the arguments to dynamically alter the headers
  ///@return : {Future<Map<String, dynamic>>} -> a response
  static Future<Map<String, dynamic>> post(String endpoint, dynamic data) async {
    final response = await http.post(
      Uri.parse(endpoint),
      headers: {'Content-Type' : 'application/json'},
      body: json.encode(data)
    );

    return _handleResponse(response);
  }

  ///@description : creates a put request
  ///@args : {String} endpoint -> can be whole url string or  an endpoint, then combine with the baseUrl
  ///@args : {dynamic data} -> data to be sent to the api, dynamic for flexibility but you can change the type for type safety
  ///@note : you can expand the arguments to dynamically alter the headers
  ///@return : {Future<Map<String, dynamic>>} -> a response
  static Future<Map<String, dynamic>> put(String endpoint, dynamic data) async {
    final response = await http.put(
      Uri.parse(endpoint),
      headers : {'Content-Type': 'application/json'},
      body: json.encode(data)
    );

    return _handleResponse(response);
  }

  ///@description : creates a delete request
  ///@args : {String} endpoint -> can be whole url string or an endpoint, then combine with the base url
  ///@return : {Future<Map<String, dynamic>>} -> a response
  static Future<Map<String, dynamic>> delete(String endpoint) async {
    final response = await http.delete(
      Uri.parse(endpoint)
    );
    return _handleResponse(response);
  }

  ///@description : http helper function that formats the response 
  ///@args : {http.Response} response -> response from the api endpoint
  ///@note : you can reuse this on your functions to return consistent responses
  static Map<String, dynamic> _handleResponse(http.Response response) {
    if(response.statusCode == 200){
      return json.decode(response.body);
    }else{
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}