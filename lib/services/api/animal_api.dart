import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_app_template/core/navigation/route_params/add_animal_summary.dart';
import 'package:mobile_app_template/core/utils/helpers/app_exception.dart';
import 'package:mobile_app_template/core/utils/helpers/map_helpers.dart';
import 'package:mobile_app_template/core/utils/http/dio_client.dart';
import 'package:mobile_app_template/core/utils/http/response.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';

class AnimalApi {
  final String _basePath = "animal-database";
  final String _addAnimal = "animal";

  bool _isInitialized = false;
  late Uri _baseUri;

  late DioHTTPHelper _dio;

  AnimalApi._internal();

  static final AnimalApi _instance = 
    AnimalApi._internal();

  factory AnimalApi() => _instance;

  Future<void> init() async {
    final ip = dotenv.env['LOCALHOST_IP_ADDRESS'];
    if(ip == null) throw TAppException("Missing LOCALHOST_IP_ADDRESS in .env");
    if(!_isInitialized){
      _baseUri = Uri.parse('http://$ip:8000/$_basePath');
      _dio = DioHTTPHelper();
      _isInitialized = true;
    }
  }

  Future<TResponse> addAnimal(AddAnimalSummaryParams params)async{
    final url = Uri(
      scheme: _baseUri.scheme,
      host: _baseUri.host,
      port: _baseUri.port,
      path: '${_baseUri.path}/$_addAnimal'
    );
    //stringify non files key value pair
    final payload = TMapHelpers.stringifyDynamicMap(params.toMap());
    //seperate the image as it is in file form
    final image = params.getImage();
    MapEntry<String, MultipartFile>? file;
    if(image != null){
      file = MapEntry("image",await DioHTTPHelper.createMultiPartFileFromXFile(image));
    }

    final response = await _dio.postMultipart<Map<String, dynamic>>(
      url: url, 
      files: file != null? [file]: null,
      fields: payload,
      fromJson: DioHTTPHelper.defaultFromJson
    );

    TLogger.info('Response of add animal: ${response.toString()}');

    return response;
  }
}
