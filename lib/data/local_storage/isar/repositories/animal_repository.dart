
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:isar/isar.dart';
import 'package:mobile_app_template/core/enums/animal_sex.dart';
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
import 'package:mobile_app_template/features/animal_database/widgets/animal_summary_card/animal_species_summary.dart';
import 'package:mobile_app_template/features/animal_database/widgets/general_summary_card/general_animal_summary.dart';


///## AnimalRepository
/// This repository handles all CRUD operations for animals in the local Isar database.
/// It provides methods to add, retrieve, and summarize animal data.
/// It also includes methods to filter and sort animals based on various criteria.
class AnimalRepository {
  final Isar _db;
  
  AnimalRepository(this._db);
  //create crud operations for the local storage for animals

  /// Adds a new animal to the local database.
  ///  ### Parameters:
  /// - **[params]**: The parameters required to create a new animal.
  ///  ### Returns:
  /// - A [TResponse] indicating success or failure of the operation.
  /// ### Throws:
  /// - Throws an exception if the image file cannot be saved or if any other error occurs
  /// during the transaction.
  /// ### Note:
  /// - The method reads the image bytes before starting the transaction to ensure the file is saved
  /// correctly. If the image file is not available, it skips saving the image.
  /// - If an error occurs during the transaction, it cleans up any saved image files to
  /// prevent orphaned files in the local storage.
  /// - The method returns a [TResponse] with a success status and a message indicating
  /// the result of the operation.
  /// - After saving, it retrieves the updated list of animals and logs the current count.
  /// - The method also saves the vaccination and medication history for the animal.
  /// - The animal's save status is set to draft initially.
  /// - The method supports adding vaccinations and medications as part of the animal's history.
  /// - It uses the `LocalFileRepository` to save the image file in a specific folder structure
  /// based on the animal's ID.
  /// - The method returns a [TResponse] with the newly added animal's data.
  /// - If the operation fails, it returns a [TResponse] with an error message
  /// and cleans up any saved image files.
  /// - The method is asynchronous and returns a [Future<TResponse>].
  /// - The method uses the `AddAnimalSummaryParams` to convert the input into an
  /// `Animal` object and its associated history models.
  /// - The method handles image files using the `ImagePicker` package to allow users to
  /// select an image from their device.
  /// - The method uses the `LocalFileRepository` to handle file operations such as saving
  /// and deleting files in the local storage.
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
      TLogger.error('failed to get animals${err.toString()}');
      return TResponse<List<Animal>>(
        success: false, 
        statusCode: 400,
        message: 'Failed to get animals from local database',
        data: []
      );
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
  Future<TResponse<GeneralAnimalSummary>> getGeneralAnimalSummaryData() async {
    try{
      final results = await Future.wait([
        getAnimalByStatusCoount(AnimalStatus.adopted),
        getAnimalByStatusCoount(AnimalStatus.on_campus),
        getAnimalByStatusCoount(AnimalStatus.owned),
        getAnimalByStatusCoount(AnimalStatus.transient),
        getAnimalByStatusCoount(AnimalStatus.rainbow_bridge),
        getAnimalBySpeciesCount(AnimalSpecies.cat),
        getAnimalBySpeciesCount(AnimalSpecies.dog)
      ]);

      final generalSummary = GeneralAnimalSummary()
        ..adopted = results[0].data ?? 0
        ..onCampus = results[1].data ?? 0
        ..owned = results[2].data ?? 0
        ..transient = results[3].data ?? 0
        ..rainbowBridge = results[4].data ?? 0
        ..cat = results[5].data ?? 0
        ..dog = results[6].data ?? 0;

      return TResponse(
        success: true, 
        statusCode: 200, 
        data: generalSummary
      );
    }catch(err){
      TLogger.error(err.toString());
      return TResponse(
        success: false, 
        statusCode: 400,
        message: 'Failed to get general animal summary data',
        data: GeneralAnimalSummary()
      );
    }
  }

  Future<TResponse<AnimalSpeciesSummary>> getAnimalSpeciesSummaryData (AnimalSpecies species) async {
    try{
      final animalsBySpeciesQuery = _db.animals.where()
        .filter()
        .speciesEqualTo(species);
      
      final speciesSpecificFemaleQuery = animalsBySpeciesQuery
        .sexEqualTo(AnimalSex.female);

      final speciesSpecificMaleQuery = animalsBySpeciesQuery
        .sexEqualTo(AnimalSex.male);

      final speciesSpecificNeuteredQuery = speciesSpecificMaleQuery
        .sterilizationDateIsNotNull();

      final speciesSpecificSpayedQuery = speciesSpecificFemaleQuery
        .sterilizationDateIsNotNull();

      final results = await Future.wait([
        speciesSpecificMaleQuery.count(),
        speciesSpecificFemaleQuery.count(),
        speciesSpecificNeuteredQuery.count(),
        speciesSpecificSpayedQuery.count()
      ]);

      return TResponse(
        statusCode: 200,
        success: true,
        data: AnimalSpeciesSummary()
          ..maleCount = results[0]
          ..femaleCount = results[1]
          ..neuteredCount = results[2]
          ..spayedCount = results[3]
      );
    }catch(err){
      TLogger.error(err.toString());
      return TResponse(
        success: false,
        statusCode: 400,
        message: 'Failed to get animal species summary data',
        data: AnimalSpeciesSummary()
      );
    }
  }

}

enum AnimalSortBy{
  name,
  age,
  updatedAt
}