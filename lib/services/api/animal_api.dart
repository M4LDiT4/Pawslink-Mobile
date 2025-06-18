import 'package:http/http.dart' as http;
import 'package:mobile_app_template/core/navigation/route_params/add_animal_summary.dart';
import 'package:mobile_app_template/core/utils/http/http_client.dart';
import 'package:mobile_app_template/core/utils/http/response.dart';

class AnimalApi {
  static const String _baseUrl = '192.168.1.105';
  static const String _addAnimalPath = '/api/animal/add';

  AnimalApi._();

  static Future<TResponse> addAnimal(AddAnimalSummaryParams params) async {
    final url = Uri.http(_baseUrl, _addAnimalPath);

    // Convert params into a Map (assumes AddAnimalSummaryParams has a toJson method)
    final payload = THttpHelper.stringifyDynamicMap(params.toMap());
    final image = params.getImage();

    final files = <String, http.MultipartFile>{};

    if (image != null) {
      files['animalImage'] =await  THttpHelper.createMultipartFileFromXFile(image, fieldName: "");
    }
    // Make POST request
    final response = await THttpHelper.postMultipart<Map<String, dynamic>>(
      url: url,
      fields: payload,
      files: files,
      fromJson: THttpHelper.defaultFromJson
    );

    return response;
  }
}
