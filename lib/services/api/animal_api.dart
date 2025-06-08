import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_app_template/core/navigation/route_params/add_animal_summary.dart';

class AnimalApi {
  static const String _baseUrl = 'localhost:8000';
  static const String _addAnimalPath = '/api/animal/add';

  AnimalApi._();

  static Future<Map<String, dynamic>> addAnimal(AddAnimalSummaryParams params) async {
    final url = Uri.http(_baseUrl, _addAnimalPath);

    // Convert params into a Map (assumes AddAnimalSummaryParams has a toJson method)
    final payload = params.toMap();

    // Set headers
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    // Make POST request
    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(payload),
    );

    // Handle response
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to add animal: ${response.statusCode} - ${response.body}');
    }
  }
}
