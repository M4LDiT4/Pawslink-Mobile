import 'dart:io';

import 'package:bson/bson.dart';
import 'package:isar/isar.dart';
import 'package:mobile_app_template/core/enums/animal_sex.dart';
import 'package:mobile_app_template/core/enums/animal_species.dart';
import 'package:mobile_app_template/core/enums/animal_status.dart';
import 'package:mobile_app_template/core/enums/database_actions.dart';
import 'package:mobile_app_template/core/enums/database_collections.dart';
import 'package:mobile_app_template/core/enums/sync_status.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';
import 'package:mobile_app_template/data/local_storage/isar/helpers/filter_helper.dart';
import 'package:mobile_app_template/domain/entities/animal_dto.dart';
import 'package:mobile_app_template/domain/models/image_file_mapping.dart';
import 'package:mobile_app_template/domain/models/local_activity_log.dart';
import 'package:mobile_app_template/domain/models/local_animal_medication_record.dart';
import 'package:mobile_app_template/domain/models/local_animal_model.dart';
import 'package:mobile_app_template/domain/models/local_animal_vaccination_history.dart';
import 'package:mobile_app_template/domain/models/time_stamp.dart';
import 'package:mobile_app_template/domain/repositories/local/file_repository.dart';
import 'package:mobile_app_template/domain/services/local/animal_repository.dart';
import 'package:mobile_app_template/network/operation_response.dart';
import 'package:http/http.dart' as http;

class LocalAnimalRepository {
  final Isar _db;

  LocalAnimalRepository(this._db);

  Future<OperationResponse<AnimalDTO>> addAnimal(
    AnimalDTO animalDto,
    File profilePicture
  )async {
    File? imageFile;
    try{
      final remoteId = ObjectId().oid;
      animalDto.remoteId = remoteId; // set the remote id here
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

        localAnimal.remoteId = remoteId;
        await _db.localAnimalModels.putWithTimestamps(localAnimal);

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

        final actLog = LocalActivityLog()
          ..action = DatabaseAction.create
          ..targetCollection = DatabaseCollections.animal
          ..syncStatus = SyncStatus.notSynced
          ..targetObjectId = remoteId
          ..description = "Created animal with name ${animalDto.name}";

        await _db.localActivityLogs.put(actLog);
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

 Future<OperationResponse<List<LocalAnimalModel>>> getAnimals({
    DynamicIsarFilter? name,
    DynamicIsarFilter? species,
    DynamicIsarFilter? status,
    DynamicIsarFilter? location,
    DynamicIsarFilter? age,
    DynamicIsarFilter? sex,
    AnimalSortBy? sortBy,
    Sort? sortOrder,
    int? pageNum,
    int? itemsPerPage,
  }) async {
    try {
      // provide defaults if null
      final effectiveSortBy = sortBy ?? AnimalSortBy.updatedAt;
      final effectiveSortOrder = sortOrder ?? Sort.asc;
      final effectivePageNum = pageNum ?? 1;
      final effectiveItemsPerPage = itemsPerPage ?? 10;

      QueryBuilder<LocalAnimalModel, LocalAnimalModel, QWhere> whereQuery =
          _db.localAnimalModels.where();

      QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterFilterCondition>
          filtered = whereQuery.filter()
              .optional(name != null, (q) => q.nameContains(name!.value))
              .optional(location != null, (q) => q.locationContains(location!.value))
              .optional(age != null, (q) {
        final strategy = age!.strategy;
        switch (strategy) {
          case FilterConditionType.greaterThan:
            return q.ageGreaterThan(age.value);
          case FilterConditionType.lessThan:
            return q.ageLessThan(age.value);
          default:
            return q.ageEqualTo(age.value);
        }
      }).optional(species != null, (q) => q.speciesEqualTo(species!.value))
        .optional(status != null, (q) => q.statusEqualTo(status!.value))
        .optional(sex != null, (q) => q.sexEqualTo(sex!.value));

      QueryBuilder<LocalAnimalModel, LocalAnimalModel, QAfterSortBy> sorted;

      if (effectiveSortOrder == Sort.asc) {
        switch (effectiveSortBy) {
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
      } else {
        switch (effectiveSortBy) {
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

      final offset = (effectivePageNum - 1) * effectiveItemsPerPage;

      final result = await sorted.offset(offset).limit(effectiveItemsPerPage).findAll();

      return OperationResponse<List<LocalAnimalModel>>(
        isSuccessful: true,
        statusCode: 200,
        data: result,
      );
    } catch (err) {
      TLogger.error("Failed to get animals: ${err.toString()}");
      return OperationResponse<List<LocalAnimalModel>>(
        isSuccessful: false,
        statusCode: 400,
        data: [],
        message: "Failed to load animals",
      );
    }
  }

  Future<OperationResponse<int>> countAnimals({
    String? name,
    AnimalSpecies? species,
    AnimalStatus? status,
    String? location,
    AnimalSex? sex,
    bool? isSterilized
  }) async {
    try {
      QueryBuilder<LocalAnimalModel, LocalAnimalModel, QWhere> whereQuery = 
        _db.localAnimalModels.where();

      final filtered = whereQuery.filter()
        .optional(name != null, (q) => q.nameContains(name!))
        .optional(location != null, (q) => q.locationContains(location!))
        .optional(species != null, (q) => q.speciesEqualTo(species!))
        .optional(status != null, (q) => q.statusEqualTo(status!))
        .optional(sex != null, (q) => q.sexEqualTo(sex!))
        .optional(isSterilized != null, (q)=> isSterilized!? q.sterilizatonDateIsNotNull(): q.sterilizatonDateIsNull())
        ;

      final total = await filtered.count();

      return OperationResponse<int>(
        isSuccessful: true,
        statusCode: 200,
        data: total,
      );
    } catch (err) {
      TLogger.error("Failed to count animals: ${err.toString()}");
      return OperationResponse<int>(
        isSuccessful: false,
        statusCode: 400,
        data: 0,
        message: "Failed to count animals",
      );
    }
  }

  Future<OperationResponse<List<LocalAnimalModel>>> searchAnimalByString(String query)async{
    try{
      final animals = await _db.localAnimalModels
        .filter()
        .nameContains(query)
        .limit(10)
        .findAll();
      return OperationResponse(
        isSuccessful: true,
        statusCode: 200,
        data: animals,
      );

    }catch(err){
      TLogger.error('Error occured while search for animals');
      return OperationResponse.failedResponse(
        message: 'Error fetching animal with name containing $query'
      );
    }
  }

  Future<OperationResponse<List<LocalAnimalModel>>> getAnimalsByBSONId(String bsonId)async{
    try{
      final animals = await _db.localAnimalModels
        .filter()
        .remoteIdEqualTo(bsonId)
        .findAll();
      return OperationResponse(
        isSuccessful: true,
        statusCode: 200,
        data: animals
      );
    }catch(err){
      TLogger.error("Error occured while getting animal with BSON Id $bsonId");
      return OperationResponse.failedResponse(
        message: 'Failed to get animal associated with the BSON ID'
      );
    }
  }

  Future<void> updateAnimals(List<AnimalDTO> animals) async {
    if (animals.isEmpty) return;

    final downloadedFiles = <String, File>{}; // remoteLink -> local file

    try {
      // -------------------------------
      // 1. Pre-download files
      // -------------------------------
      for (final dto in animals) {
        if (dto.profileImageLink != null) {
          try {
            final response = await http.get(Uri.parse(dto.profileImageLink!));
            if (response.statusCode == 200) {
              final file = await LocalFileRepository.saveFile(
                dto.remoteId!,
                response.bodyBytes,
                folders: [dto.remoteId!],
                isPublic: false,
              );
              downloadedFiles[dto.profileImageLink!] = file;
            }
          } catch (e) {
            TLogger.warning("Failed to download image for ${dto.remoteId}: $e");
          }
        }
      }

      // -------------------------------
      // 2. Write core animals (no link access)
      // -------------------------------
      final localAnimals = animals.map((item) {
        final model = item.toLocalModel();
        if (model.profileImageLink != null &&
            downloadedFiles.containsKey(model.profileImageLink)) {
          final file = downloadedFiles[model.profileImageLink]!;
          model.profileImagePath = file.path;
        }
        return model;
      }).toList();

      await _db.writeTxn(() async {
        await _db.localAnimalModels.putAllByRemoteId(localAnimals);
      });

      // -------------------------------
      // 3. Save link collections separately
      // -------------------------------
      await _db.writeTxn(() async {
        for (final animal in localAnimals) {
          // only save, don't check .isNotEmpty first
          await animal.imagePaths.save();
          await animal.vaccinationHistory.save();
          await animal.medicationHistory.save();
        }
      });
    } catch (err, stack) {
      TLogger.error("Failed to update animals: $err\n$stack");

      for (final file in downloadedFiles.values) {
        if (file.existsSync()) {
          try {
            file.deleteSync();
          } catch (_) {}
        }
      }
      rethrow;
    }
  }

}