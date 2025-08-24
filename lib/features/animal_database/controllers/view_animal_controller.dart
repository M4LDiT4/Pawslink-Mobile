
import 'package:get/get.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';
import 'package:mobile_app_template/domain/services/animal%20database/animal_database_service.dart';

class ViewAnimalController extends GetxController {
  final AnimalDatabaseService _service;

  ViewAnimalController(AnimalDatabaseService service): _service = service;

  final updatesAvailable = RxBool(false);
  bool isLoading = false;


  Future<void> checkIfUpdatesAvailable()async{
    if(isLoading){
      return;
    }
    isLoading = true;
    final response = await _service.checkIfUpdatesAvailable();
    if(response.isSuccessful){
      updatesAvailable.value = response.data ?? false;
    }
    isLoading = false;
  }

  Future<void> updateAnimals()async{
    try{
      await _service.syncAnimals();
    }catch(err){
      TLogger.error("Problem updating data ${err.toString()}");
    }
  }
}