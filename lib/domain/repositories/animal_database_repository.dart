// initialize tlhis when you are in add animal section
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobile_app_template/core/utils/helpers/app_exception.dart';
import 'package:mobile_app_template/core/utils/helpers/ui_helpers.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';
import 'package:mobile_app_template/core/widgets/dialogs/save_to_drafts/save_to_drafts_dialog.dart';
import 'package:mobile_app_template/domain/entities/animal_dto.dart';
import 'package:mobile_app_template/domain/services/api/animal_api_service/animal_api_service.dart';
import 'package:mobile_app_template/domain/services/local/local_animal_service.dart';
import 'package:mobile_app_template/network/internet_connection/connection_controller.dart';
import 'package:mobile_app_template/network/operation_response.dart';

class AnimalDatabaseRepository {
  final AnimalApiService _cloudService;
  final LocalAnimalService _localService;
  // add local service here

  AnimalDatabaseRepository({
    required AnimalApiService animalApiService,
    required LocalAnimalService localAnimalService
  }): _cloudService = animalApiService,
      _localService = localAnimalService;

  Future<OperationResponse<AnimalDTO>> addAnimal(
    AnimalDTO animalDto,
    File profilePicture
  ) async{
    //  final connectionController = Get.find<ConnectionController>();
    const connectionController = false;
     if(connectionController){
      // SAVE TO CLOUD
      final response = await _cloudService.addAnimal(
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
}