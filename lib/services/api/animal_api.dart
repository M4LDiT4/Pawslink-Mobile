import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app_template/core/navigation/route_params/add_animal_summary.dart';
import 'package:mobile_app_template/core/utils/helpers/app_exception.dart';
import 'package:mobile_app_template/core/utils/helpers/map_helpers.dart';
import 'package:mobile_app_template/core/utils/http/dio_client.dart';
import 'package:mobile_app_template/core/utils/http/http_client.dart';
import 'package:mobile_app_template/core/utils/http/response.dart';

class AnimalApi {
  final String _basePath = "animal-database";
  final String _addAnimal = "add-animal";
  late Uri _baseUri;

  late DioHTTPHelper _dio;

  AnimalApi._internal();

  static final AnimalApi _instance = 
    AnimalApi._internal();

  factory AnimalApi() => _instance;

  Future<void> init() async {
    final ip = dotenv.env['LOCALHOST_IP_ADDRESS'];
    if(ip == null) throw TAppException("Missing LOCALHOST_IP_ADDRESS in .env");
    _baseUri = Uri.parse('http://$ip:8000/$_basePath');
    _dio = DioHTTPHelper();
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
    MultipartFile? file;
    if(image != null){
      file = await DioHTTPHelper.createMultiPartFileFromXFile(image, fieldName: "image");
    }

    final response = await _dio.postMultipart<Map<String, dynamic>>(
      url: url, 
      files: file != null? [file]: null,
      fields: payload,
      fromJson: DioHTTPHelper.defaultFromJson
    );

    return response;
  }
  // AnimalApi._();

  // static Future<TResponse> addAnimal(AddAnimalSummaryParams params) async {
  //   final url = Uri.http(_baseUrl, _addAnimalPath);

  //   // Convert params into a Map (assumes AddAnimalSummaryParams has a toJson method)
  //   final payload = THttpHelper.stringifyDynamicMap(params.toMap());
  //   final image = params.getImage();

  //   final files = <String, http.MultipartFile>{};

  //   if (image != null) {
  //     files['animalImage'] =await  THttpHelper.createMultipartFileFromXFile(image, fieldName: "");
  //   }
  //   // Make POST request
  //   final response = await THttpHelper.postMultipart<Map<String, dynamic>>(
  //     url: url,
  //     fields: payload,
  //     files: files,
  //     fromJson: THttpHelper.defaultFromJson
  //   );

  //   return response;
  // }
}
