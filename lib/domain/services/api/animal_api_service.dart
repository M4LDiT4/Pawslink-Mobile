
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';
import 'package:mobile_app_template/domain/entities/animal_dto.dart';
import 'package:mobile_app_template/network/network_client.dart';
import 'package:mobile_app_template/network/operation_response.dart';

class AnimalApiService {
  NetworkClient? _client;
  Uri? _baseUrl;
  final String _basePath = "animal-database";

  AnimalApiService._internal();

  static final AnimalApiService _instance = AnimalApiService._internal();

  factory AnimalApiService() => _instance;

  void init(NetworkClient client){
    if(_client != null) return;
    final backendUrl = dotenv.env['BACKEND_URL'];
    if (backendUrl == null) throw  Exception("Missing Animal Api Configuration");
    _client = client;
    _baseUrl = Uri.parse('$backendUrl$_basePath');
  }

}