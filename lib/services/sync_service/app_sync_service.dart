

import 'package:dio/dio.dart';
import 'package:isar/isar.dart';
import 'package:mobile_app_template/data/local_storage/isar/model/animal_model.dart';
import 'package:path_provider/path_provider.dart';

class AppSyncService {

  AppSyncService();

  Future<void> checkAndUpdateAnimals() async{

  }

  static Future<Map<String, dynamic>> _getAnimalUpdates(
    {
      required Uri uri,
      required String lastUpdatedId,
    }
  ) async {
    final dio = Dio();
    final response = await dio.get(uri.toString());
    if (response.statusCode == 200) {
      return response.data as Map<String, dynamic>;
    } else {
      throw Exception('Failed to fetch updates: ${response.statusMessage}');
    }
  }

  Future<void> _saveAnimals(List<dynamic> animals) async {
    final dir = await getApplicationDocumentsDirectory();

    final isar = await Isar.open([AnimalSchema], directory: dir.path);

  }
}