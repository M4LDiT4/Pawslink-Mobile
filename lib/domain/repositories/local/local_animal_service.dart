import 'dart:io';

import 'package:bson/bson.dart';
import 'package:isar/isar.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';
import 'package:mobile_app_template/domain/entities/animal_dto.dart';
import 'package:mobile_app_template/domain/models/local_animal_medication_record.dart';
import 'package:mobile_app_template/domain/models/local_animal_model.dart';
import 'package:mobile_app_template/domain/models/local_animal_vaccination_history.dart';
import 'package:mobile_app_template/domain/repositories/local/file_repository.dart';
import 'package:mobile_app_template/network/operation_response.dart';

class LocalAnimalRepository {
  final Isar _db;

  LocalAnimalRepository(this._db);

  Future<OperationResponse<AnimalDTO>> addAnimal(
    AnimalDTO animalDto,
    File profilePicture
  )async {
    File? imageFile;
    try{
      final localAnimal = animalDto.toLocalModel();

      final vaccinations = animalDto.vaccinationHistory
        .map((item) => item.toLocalModel())
        .toList();
      final medications = animalDto.medicationHistory
        .map((item) => item.toLocalModel())
        .toList();
      
      localAnimal.medicationHistory.addAll(medications);
      localAnimal.vaccinationHistory.addAll(vaccinations);

      final pictureInBytes = await profilePicture.readAsBytes();

      await _db.writeTxn(() async {
        await _db.localAnimalMedicationRecords.putAll(medications);
        await _db.localAnimalVaccinationRecords.putAll(vaccinations);

        await localAnimal.medicationHistory.save();
        await localAnimal.vaccinationHistory.save();

        final remoteId = ObjectId().oid;

        localAnimal.remoteId = remoteId;
        await _db.localAnimalModels.put(localAnimal);

        imageFile = await LocalFileRepository.saveFile(
          remoteId,
          pictureInBytes ,
          folders: [remoteId],
          isPublic: false
        );

        if(imageFile == null){
          throw Exception('Failed to save the animal profile picture');
        }

        localAnimal.profileImagePath = imageFile!.path;

        await _db.localAnimalModels.put(localAnimal);
      });

      return OperationResponse<AnimalDTO>(
        isSuccessful: true, 
        statusCode: 200,
        message: 'Animal saved to local database successfully',
        data: AnimalDTO.fromLocalAnimalModel(localAnimal)
      );

    }catch(err){
      TLogger.error("Failed to save the data locally ${err.toString()}");
      return OperationResponse.failedResponse(
        message: 'Failed to save the animal to local database'
      );
    }
  }
}