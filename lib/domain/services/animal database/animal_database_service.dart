// initialize tlhis when you are in add animal section
import 'dart:io';
import 'package:get/get.dart';
import 'package:mobile_app_template/core/utils/helpers/ui_helpers.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';
import 'package:mobile_app_template/core/widgets/dialogs/save_to_drafts/save_to_drafts_dialog.dart';
import 'package:mobile_app_template/domain/entities/animal_dto.dart';
import 'package:mobile_app_template/domain/repositories/api/animal_api_repository.dart';
import 'package:mobile_app_template/domain/repositories/local/local_animal_service.dart';
import 'package:mobile_app_template/network/internet_connection/connection_controller.dart';
import 'package:mobile_app_template/network/operation_response.dart';

class AnimalDatabaseService {
  final AnimalApiRepository _cloudRepo;
  final LocalAnimalRepository _localService;

  AnimalDatabaseService({
    required AnimalApiRepository animalApiService,
    required LocalAnimalRepository localAnimalService
  }): _cloudRepo = animalApiService,
      _localService = localAnimalService;

  Future<OperationResponse<AnimalDTO>> addAnimal(
    AnimalDTO animalDto,
    File profilePicture
  ) async{
    //  final connectionController = Get.find<ConnectionController>();
    final connectionController = Get.find<ConnectionController>();
    if(connectionController.isConnected){
    final response = await _cloudRepo.addAnimal(
      animalDto,
      profilePicture: profilePicture
    );
    return response;
    }else{
      final saveToDrafts = await TUIHelpers.showResponsiveModal<bool>(
        child: const SaveToDraftsDialog()
      );

      if(saveToDrafts != null && saveToDrafts){
        final response = await _localService.addAnimal(
          animalDto, 
          profilePicture
        );
        return response;
      }
      return OperationResponse(isSuccessful: false, statusCode: 200);
    }
  }

  Future<OperationResponse<AnimalDTO>> saveAnimalLocally(AnimalDTO animalDto, File profilePicture)async{
    try{
      final response = await _localService.addAnimal(animalDto, profilePicture);
      return response;
    }catch(err, stack){
      TLogger.debug('Stack:\n$stack');
      return OperationResponse<AnimalDTO>.failedResponse(
        message: 'Failed to save animal locally'
      );
    }
  }

  Future<OperationResponse<AnimalDTO>> saveAnimalToCloud(AnimalDTO animalDto, File profilePicture) async {
    try{
      final response = await _cloudRepo.addAnimal(
        animalDto,
        profilePicture: profilePicture
      );
      return response;
    }catch(err, stack){
      TLogger.error("Failed to save animal to cloud: ${err.toString()}");
      TLogger.debug('Stack:\n$stack');
      return OperationResponse<AnimalDTO>.failedResponse(
        message: 'Failed to save animal to cloud'
      );
    }
  }
}