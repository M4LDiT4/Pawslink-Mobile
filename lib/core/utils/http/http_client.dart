import 'dart:convert';
import 'package:http/http.dart' as http;

class THttpHelper {
  THttpHelper._();

  /// ---------------- GET ----------------
  static Future<Map<String, dynamic>> get({
    required Uri url,
    Map<String, String>? headers,
  }) async {
    final response = await http.get(url, headers: headers);
    return _handleResponse(response);
  }

  /// ---------------- DELETE ----------------
  static Future<Map<String, dynamic>> delete({
    required Uri url,
    Map<String, String>? headers,
  }) async {
    final response = await http.delete(url, headers: headers);
    return _handleResponse(response);
  }

  /// ---------------- POST JSON ----------------
  static Future<Map<String, dynamic>> postJson({
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
  static Future<Map<String, dynamic>> putJson({
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
  static Future<Map<String, dynamic>> postForm({
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
  static Future<Map<String, dynamic>> putForm({
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
  static Future<Map<String, dynamic>> postMultipart({
    required Uri url,
    Map<String, String>? fields,
    Map<String, http.MultipartFile>? files,
    Map<String, String>? headers,
  }) async {
    final request = http.MultipartRequest('POST', url);
    if (headers != null) request.headers.addAll(headers);
    if (fields != null) request.fields.addAll(fields);
    if (files != null) request.files.addAll(files.values);

    final streamed = await request.send();
    final response = await http.Response.fromStream(streamed);
    return _handleResponse(response);
  }

  /// ---------------- PUT MULTIPART ----------------
  static Future<Map<String, dynamic>> putMultipart({
    required Uri url,
    Map<String, String>? fields,
    Map<String, http.MultipartFile>? files,
    Map<String, String>? headers,
  }) async {
    final request = http.MultipartRequest('PUT', url);
    if (headers != null) request.headers.addAll(headers);
    if (fields != null) request.fields.addAll(fields);
    if (files != null) request.files.addAll(files.values);

    final streamed = await request.send();
    final response = await http.Response.fromStream(streamed);
    return _handleResponse(response);
  }

  /// ---------------- Response Handler ----------------
  static Map<String, dynamic> _handleResponse(http.Response response) {
    final statusCode = response.statusCode;
    if (statusCode >= 200 && statusCode < 300) {
      try {
        return json.decode(response.body);
      } catch (_) {
        return {'success': true, 'message': 'No JSON body'};
      }
    } else {
      throw Exception(
        'HTTP ${response.statusCode}: ${response.reasonPhrase}\n${response.body}',
      );
    }
  }
}
