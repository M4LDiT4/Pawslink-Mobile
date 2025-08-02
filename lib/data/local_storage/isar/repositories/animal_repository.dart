
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:isar/isar.dart';
import 'package:mobile_app_template/core/enums/animal_species.dart';
import 'package:mobile_app_template/core/enums/animal_status.dart';
import 'package:mobile_app_template/core/navigation/route_params/add_animal_summary.dart';
import 'package:mobile_app_template/core/utils/http/response.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';
import 'package:mobile_app_template/data/local_storage/isar/helpers/filter_helper.dart';
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

  Future<TResponse> addAnimal(AddAnimalSummaryParams params) async {
    File? imageFile;
    Uint8List? imageBytes;

    try {
      final animal = params.toAnimal();
      animal.saveStatus = SaveStatus.draft;

      final vaccinations = params.vaccinations
          .map((item) => item.modalInputToAnimalVaxModel())
          .toList();
      final medications = params.medications
          .map((item) => item.modalInputToAnimalMedModel())
          .toList();

      animal.vaxHistory.addAll(vaccinations);
      animal.medHistory.addAll(medications);

      // Read image bytes before transaction if available
      final XFile? selectedImage = params.getImage();
      if (selectedImage != null) {
        imageBytes = await selectedImage.readAsBytes();
      }

      await _db.writeTxn(() async {
        // Save history first
        await _db.animalMedications.putAll(medications);
        await _db.animalVaccinations.putAll(vaccinations);

        await animal.medHistory.save();
        await animal.vaxHistory.save();

        // Save the animal itself
        final id = await _db.animals.put(animal);

        if (imageBytes != null) {
          // Save the image file
          imageFile = await LocalFileRepository.saveFile(
            null,
            imageBytes,
            folders: [id.toString()],
            isPublic: false,
          );

          if (imageFile == null) {
            throw Exception('Failed to save image file.');
          }

          // Update animal with image path
          animal.imgUrl = imageFile!.path;
        }
        await _db.animals.put(animal);
      });

      final newAnimalList = await  getAnimals();
      TLogger.info('Current animal count: ${newAnimalList.data!.length}');

      return TResponse(
        success: true,
        statusCode: 200,
        message: 'Animal saved to local database successfully',
      );
    } catch (err) {
      // Clean up image if something failed
      if (imageFile != null && await imageFile!.exists()) {
        await LocalFileRepository.findAndDelete(imageFile!);
      }

      return TResponse(
        success: false,
        statusCode: 400,
        message:
            'Failed to save ${params.name} to the local database: ${err.toString()}',
      );
    }
  }

  Future<TResponse<List<Animal>>> getAnimals(
    {
      DynamicIsarFilter? name,
      DynamicIsarFilter? location,
      DynamicIsarFilter? age,
      DynamicIsarFilter? species,
      DynamicIsarFilter? status,
      DynamicIsarFilter? sex,
      AnimalSortBy sortBy = AnimalSortBy.updatedAt,
      Sort sortOrder = Sort.asc,
      int pageNum = 1,
      int itemsPerPage = 10
    }
  ) async {
    try{
      QueryBuilder<Animal, Animal, QWhere> whereQuery = _db.animals.where();
      QueryBuilder<Animal, Animal, QAfterFilterCondition> filtered = whereQuery.filter()
      .optional(
        name != null,
        (q) => q.nameContains(name!.value)
      )
      .optional(
        location != null, 
        (q) => q.locationContains(location!.value)
      )
      .optional(
        age != null, 
        (q){
          final strategy = age!.strategy;
          switch(strategy){
            case FilterConditionType.greaterThan:
              return q.ageGreaterThan(age.value);
            case FilterConditionType.lessThan:
              return q.ageLessThan(age.value);
            default:
              return q.ageEqualTo(age.value);
          }
        }
      )
      .optional(
        species != null, 
        (q) => q.speciesEqualTo(species!.value)
      )
      .optional(
        status != null, 
        (q) => q.statusEqualTo(status!.value)
      )
      .optional(
        sex != null, 
        (q) => q.sexEqualTo(sex!.value)
      );

      QueryBuilder<Animal, Animal, QAfterSortBy> sorted;
      
      if(sortOrder == Sort.asc){
        switch(sortBy){
          case AnimalSortBy.name:
            sorted = filtered.sortByName();
            break;
          case AnimalSortBy.age:
            sorted = filtered.sortByAge();
            break;
          default:
            sorted = filtered.sortByUpdatedAt();
            break;
        }
      }else{
        switch(sortBy){
          case AnimalSortBy.name:
            sorted = filtered.sortByNameDesc();
            break;
          case AnimalSortBy.age:
            sorted = filtered.sortByAgeDesc();
            break;
          default:
            sorted = filtered.sortByUpdatedAtDesc();
            break;
        }
      }

      final offset = (pageNum -1) * itemsPerPage;
      
      final result = await sorted.offset(offset).limit(itemsPerPage).findAll();

      return TResponse<List<Animal>>(
        success: true, 
        statusCode: 200,
        message: 'Local Animal Query Success',
        data: result
      );

    }catch(err){
      return TResponse.failed(err.toString());
    }
  }

  Future<TResponse<int>> getAnimalByStatusCoount(AnimalStatus status) async{
    try{
      final result = await _db.animals.where()
        .filter()
        .statusEqualTo(status)
        .count();

      return TResponse(
        success: true, 
        statusCode: 200,
        data: result
      );
    }catch(err){
      TLogger.error(err.toString());
      return TResponse(
        success: false, 
        statusCode: 400,
        data: null
      );
    }
  }

  Future<TResponse<int>> getAnimalBySpeciesCount(AnimalSpecies species) async {
    try{
      final result = await _db.animals.where().filter()
        .speciesEqualTo(species)
        .count();
      
      return TResponse(
        success: true, 
        statusCode: 200,
        data: result
      );
    }catch(err){
      TLogger.error(err.toString());
      return TResponse(
        success: false, 
        statusCode: 400,
        data: null
      );
    }
  }
}

enum AnimalSortBy{
  name,
  age,
  updatedAt
}