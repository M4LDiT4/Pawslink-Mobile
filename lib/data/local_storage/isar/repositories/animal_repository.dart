
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:isar/isar.dart';
import 'package:mobile_app_template/core/navigation/route_params/add_animal_summary.dart';
import 'package:mobile_app_template/core/utils/http/response.dart';
import 'package:mobile_app_template/data/local_storage/isar/model/animal_med_history_model.dart';
import 'package:mobile_app_template/data/local_storage/isar/model/animal_model.dart';
import 'package:mobile_app_template/data/local_storage/isar/model/animal_vax_history_model.dart';
import 'package:mobile_app_template/data/local_storage/save_status.dart';
import 'package:mobile_app_template/data/model/modal_input_list_item.dart';
import 'package:mobile_app_template/data/repositories/file_repository.dart';

class AnimalRepository {
  final Isar _db;
  
  AnimalRepository(this._db);
  //create crud operations for the local storage for animals

  Future<TResponse> addAnimal(
    AddAnimalSummaryParams params
  ) async{
    File? imageFile;
    try{
      Animal animal = params.toAnimal();
      animal.saveStatus = SaveStatus.draft;
      
      final vaccinations = params.vaccinations.map((item) => item.modalInputToAnimalVaxModel()).toList();
      final medications = params.medications.map((item)=> item.modalInputToAnimalMedModel()).toList();

      animal.vaxHistory.addAll(vaccinations);
      animal.medHistory.addAll(medications);

      await _db.animalMedications.putAll(medications);
      await _db.animalVaccinations.putAll(vaccinations);
      await animal.medHistory.save();
      await animal.vaxHistory.save();

      await _db.writeTxn(() async{
        final id = await _db.animals.put(animal);
        Uint8List? image = params.getImage() != null? await params.getImage()!.readAsBytes(): null;
        if(image != null){
          imageFile = await LocalFileRepository.saveFile(null, image, folders: [id.toString()], isPublic:false);
          if(imageFile == null){
            throw Exception('Failed to save image.');
          }
          final savedAnimal = await _db.animals.get(id);
          if(savedAnimal == null){
            throw Exception('Failed to save animal with ID: ${id.toString()}');
          }
          savedAnimal.imgUrl = imageFile!.path;
          await _db.animals.put(savedAnimal);
        }
      });

      return TResponse(
        success: true, 
        statusCode: 200,
        message: 'Animal save to local database successfully'
      );
    }catch(err){
      if(imageFile != null){
        await LocalFileRepository.findAndDelete(imageFile!);
      }
      return TResponse(
        success: false, 
        statusCode: 400,
        message: 'Failed to save ${params.name} to the local database: ${err.toString()}'
      );
    }
  }
}