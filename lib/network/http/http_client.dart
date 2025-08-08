import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mobile_app_template/network/response.dart';

class THttpHelper {
  THttpHelper._();

  /// ---------------- GET ----------------
  static Future<TResponse<T>> get<T>({
    required Uri url,
    Map<String, String>? headers,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    final response = await http.get(url, headers: headers);
    return _handleResponse<T>(response, fromJson: fromJson);
  }

  /// ---------------- DELETE ----------------
  static Future<TResponse<T>> delete<T>({
    required Uri url,
    Map<String, String>? headers,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    final response = await http.delete(url, headers: headers);
    return _handleResponse<T>(response, fromJson: fromJson);
  }

  /// ---------------- POST JSON ----------------
  static Future<TResponse<T>> postJson<T>({
    required Uri url,
    required dynamic body,
    Map<String, String>? headers,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        ...?headers,
      },
      body: json.encode(body),
    );
    return _handleResponse<T>(response, fromJson: fromJson);
  }

  /// ---------------- PUT JSON ----------------
  static Future<TResponse<T>> putJson<T>({
    required Uri url,
    required dynamic body,
    Map<String, String>? headers,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    final response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/json',
        ...?headers,
      },
      body: json.encode(body),
    );
    return _handleResponse<T>(response, fromJson: fromJson); 
  }

  /// ---------------- POST FORM URLENCODED ----------------
  static Future<TResponse<T>> postForm<T>({
    required Uri url,
    required Map<String, String> fields,
    required T Function(Map<String, dynamic>) fromJson,
    Map<String, String>? headers,
  }) async {
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        ...?headers,
      },
      body: fields,
    );
    return _handleResponse<T>(response, fromJson: fromJson);
  }

  /// ---------------- PUT FORM URLENCODED ----------------
  static Future<TResponse<T>> putForm<T>({
    required Uri url,
    required Map<String, String> fields,
    Map<String, String>? headers,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    final response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        ...?headers,
      },
      body: fields,
    );
    return _handleResponse<T>(response, fromJson: fromJson);
  }

  /// ---------------- POST MULTIPART ----------------
  static Future<TResponse<T>> postMultipart<T>({
    required Uri url,
    Map<String, String>? fields,
    Map<String, http.MultipartFile>? files,
    Map<String, String>? headers,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    final request = http.MultipartRequest('POST', url);

    if (headers != null) request.headers.addAll(headers);
    if (fields != null) request.fields.addAll(fields);
    if (files != null) request.files.addAll(files.values);

    final response = await http.Response.fromStream(await request.send());
    return _handleResponse<T>(response, fromJson: fromJson);
  }

  /// ---------------- PUT MULTIPART ----------------
  static Future<TResponse<T>> putMultipart<T>({
    required Uri url,
    Map<String, String>? fields,
    Map<String, http.MultipartFile>? files,
    Map<String, String>? headers,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    final request = http.MultipartRequest('PUT', url);

    if (headers != null) request.headers.addAll(headers);
    if (fields != null) request.fields.addAll(fields);
    if (files != null) request.files.addAll(files.values);

    final response = await http.Response.fromStream(await request.send());
    return _handleResponse<T>(response, fromJson: fromJson);
  }

  /// ---------------- Response Handler ----------------
  /// centralized method to handle HTTP responses
  static TResponse<T> _handleResponse<T>(
    http.Response response,
    {required T Function(Map<String, dynamic>) fromJson}
  ) {
    try{
      final jsonResponse = json.decode(response.body);
      final isSuccess = response.statusCode >= 200 && response.statusCode < 300;

      return TResponse<T>(
        success: isSuccess,
        message: jsonResponse['error']?.toString() ?? (isSuccess ? 'Success' : 'Unknowkn error ocurred'),
        data: jsonResponse['data'] != null
            ? fromJson(jsonResponse['data'])
            : null,
        statusCode: response.statusCode,
      );
    }catch(e){
      final isSuccess = response.statusCode >= 200 && response.statusCode < 300;
      return TResponse<T>(
        success: isSuccess,
        message: isSuccess ? 'Success (non-JSON)' : 'Failed to parse response',
        data: null,
        statusCode: response.statusCode,
      );
    }
  }

  static Future<http.MultipartFile> createMultipartFileFromXFile(
    XFile file, {
    required String fieldName,
  }) async {
    return http.MultipartFile.fromPath(
      fieldName,
      file.path,
      filename: file.name,
    );
  }

  static Map<String, String> stringifyDynamicMap(Map<String, dynamic> map){
    return map.map((key, value){
      return MapEntry(
        key,
        value is List ? json.encode(value) : value.toString(),
      );
    });
  }

  /// ---------------- Helper Methods ----------------
  
  /// default type for fromJson function
  static Map<String, dynamic> defaultFromJson(Map<String, dynamic> json) => json;
}
