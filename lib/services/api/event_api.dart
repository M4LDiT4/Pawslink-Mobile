
import 'package:dio/dio.dart';
import 'package:mobile_app_template/core/navigation/route_params/add_event.dart';
import 'package:mobile_app_template/core/utils/helpers/map_helpers.dart';
import 'package:mobile_app_template/network/dio/dio_client.dart';
import 'package:mobile_app_template/network/response.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';

class EventApi{
  final String _basePath = "event-repository";
  final String _addEvent = "event";

  bool _isInitialized = false;
  late Uri _baseUri;
  late DioHTTPHelper _dio;

  EventApi._internal();

  static final EventApi _instance = EventApi._internal();

  factory EventApi() => _instance;

  Future<void> init(String baseUri, DioHTTPHelper dio) async {
    if(!_isInitialized){
      _baseUri = Uri.parse('$baseUri/$_basePath');
      _dio = dio;
      _isInitialized = true;
    }
  }

  Future<TResponse> addEvent(AddEventParams param) async{
    final url = Uri(
      scheme: _baseUri.scheme,
      host: _baseUri.host,
      port: _baseUri.port,
      path: '${_baseUri.path}/$_addEvent'
    );

    final payload = TMapHelpers.stringifyDynamicMap(param.toMap());

    final image = param.getEventImage();
    
    MapEntry<String, MultipartFile>? file;
    if(image != null){
      file = MapEntry("image", await DioHTTPHelper.createMultiPartFileFromXFile(image));
    }

    final response = await _dio.postMultipart<Map<String, dynamic>>(
      url: url,
      files: file != null? [file] : null,
      fields: payload,
      fromJson: DioHTTPHelper.defaultFromJson
    );

    TLogger.info(response.toString());
    
    return response;
  }
}