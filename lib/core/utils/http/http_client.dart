import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mobile_app_template/core/utils/http/response.dart';

class THttpHelper {
  THttpHelper._();

  /// ---------------- GET ----------------
  static Future<TResponse> get({
    required Uri url,
    Map<String, String>? headers,
  }) async {
    final response = await http.get(url, headers: headers);
    return _handleResponse(response);
  }

  /// ---------------- DELETE ----------------
  static Future<TResponse> delete({
    required Uri url,
    Map<String, String>? headers,
  }) async {
    final response = await http.delete(url, headers: headers);
    return _handleResponse(response);
  }

  /// ---------------- POST JSON ----------------
  static Future<TResponse> postJson({
    required Uri url,
    required dynamic body,
    Map<String, String>? headers,
  }) async {
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        ...?headers,
      },
      body: json.encode(body),
    );
    return _handleResponse(response);
  }

  /// ---------------- PUT JSON ----------------
  static Future<TResponse> putJson({
    required Uri url,
    required dynamic body,
    Map<String, String>? headers,
  }) async {
    final response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/json',
        ...?headers,
      },
      body: json.encode(body),
    );
    return _handleResponse(response);
  }

  /// ---------------- POST FORM URLENCODED ----------------
  static Future<TResponse> postForm({
    required Uri url,
    required Map<String, String> fields,
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
    return _handleResponse(response);
  }

  /// ---------------- PUT FORM URLENCODED ----------------
  static Future<TResponse> putForm({
    required Uri url,
    required Map<String, String> fields,
    Map<String, String>? headers,
  }) async {
    final response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        ...?headers,
      },
      body: fields,
    );
    return _handleResponse(response);
  }

  /// ---------------- POST MULTIPART ----------------
  static Future<TResponse> postMultipart({
    required Uri url,
    Map<String, String>? fields,
    Map<String, http.MultipartFile>? files,
    Map<String, String>? headers,
  }) async {
    final request = http.MultipartRequest('POST', url);

    if (headers != null) request.headers.addAll(headers);
    if (fields != null) request.fields.addAll(fields);
    if (files != null) request.files.addAll(files.values);

    final response = await http.Response.fromStream(await request.send());
    return _handleResponse(response);
  }

  /// ---------------- PUT MULTIPART ----------------
  static Future<TResponse> putMultipart({
    required Uri url,
    Map<String, String>? fields,
    Map<String, http.MultipartFile>? files,
    Map<String, String>? headers,
  }) async {
    final request = http.MultipartRequest('PUT', url);

    if (headers != null) request.headers.addAll(headers);
    if (fields != null) request.fields.addAll(fields);
    if (files != null) request.files.addAll(files.values);

    final response = await http.Response.fromStream(await request.send());
    return _handleResponse(response);
  }

  /// ---------------- Response Handler ----------------
  static TResponse _handleResponse(http.Response response) {
    return TResponse.fromHttpResponse(response);
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
}
