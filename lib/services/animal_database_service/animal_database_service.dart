
import 'package:get/instance_manager.dart';
import 'package:mobile_app_template/core/utils/internet_connection/connection_controller.dart';
import 'package:mobile_app_template/services/api/animal_api.dart';

class AnimalDatabaseService {
  late final ConnectionController _connectionController;
  late final AnimalApi _animalApi;

  void init() async {
    _connectionController = Get.find<ConnectionController>();
    _animalApi = AnimalApi();
    _animalApi.init();
    
  }
}