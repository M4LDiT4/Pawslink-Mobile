
import 'package:get/get.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';
import 'package:mobile_app_template/domain/services/animal%20database/animal_database_service.dart';

class ViewAnimalController extends GetxController {
  final AnimalDatabaseService service;

  ViewAnimalController(this.service);

  final updatesAvailable = RxBool(false);

  Future<void> checkUpdates()async{
    try{
      final response = await service.checkUpdates();
      if(!response.isSuccessful || response.data == null){
        throw Exception("Response status is${response.isSuccessful}, data received: ${response.data}");
      }
      updatesAvailable.value = false;
    }catch(err){
      TLogger.error(err.toString());
      if(updatesAvailable.value != false){
        updatesAvailable.value = false;
      }
    }
  }
}