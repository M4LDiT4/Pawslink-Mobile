import 'dart:io';

import 'package:bson/bson.dart';
import 'package:http/http.dart' as http;
import 'package:isar/isar.dart';
import 'package:mobile_app_template/core/enums/animal_sex.dart';
import 'package:mobile_app_template/core/enums/animal_species.dart';
import 'package:mobile_app_template/core/enums/animal_status.dart';
import 'package:mobile_app_template/core/enums/database_actions.dart';
import 'package:mobile_app_template/core/enums/database_collections.dart';
import 'package:mobile_app_template/core/enums/sync_status.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';
import 'package:mobile_app_template/data/local_storage/isar/helpers/filter_helper.dart';
import 'package:mobile_app_template/data/local_storage/isar/model/animal_med_history_model.dart';
import 'package:mobile_app_template/data/local_storage/isar/model/animal_model.dart';
import 'package:mobile_app_template/data/local_storage/isar/model/animal_vax_history_model.dart';
import 'package:mobile_app_template/domain/entities/animal_dto.dart';
import 'package:mobile_app_template/domain/entities/animal_medication_dto.dart';
import 'package:mobile_app_template/domain/entities/animal_vaccination_dto.dart';
import 'package:mobile_app_template/domain/models/local_activity_log.dart';
import 'package:mobile_app_template/domain/models/local_animal_medication_record.dart';
import 'package:mobile_app_template/domain/models/local_animal_model.dart';
import 'package:mobile_app_template/domain/models/local_animal_vaccination_history.dart';
import 'package:mobile_app_template/domain/models/time_stamp.dart';
import 'package:mobile_app_template/domain/repositories/local/file_repository.dart';
import 'package:mobile_app_template/domain/services/local/animal_repository.dart';
import 'package:mobile_app_template/network/operation_response.dart';

class LocalAnimalRepository {
  final Isar _db;

    // private constructor
  LocalAnimalRepository._internal(this._db);

  // static instance
  static LocalAnimalRepository? _instance;

  // factory constructor for singleton
  factory LocalAnimalRepository(Isar db) {
    _instance ??= LocalAnimalRepository._internal(db);
    return _instance!;
  }

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
        .optional(isSterilized != null, (q)=> isSterilized!? q.sterilizationDateIsNotNull(): q.sterilizationDateIsNull())
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
  
  // Future<LocalAnimalModel> upsertAnimal(
  //   AnimalDTO remoteAnimal
  // ) async {
  //   final List<File> imageList = [];
  //   try{
  //     //get the local animal if it exist
  //     LocalAnimalModel? localCopy;
  //     if(remoteAnimal.remoteId != null){
  //       final localAnimals = await _db.localAnimalModels.filter()
  //         .remoteIdEqualTo(remoteAnimal.remoteId).findAll();
  //       if(localAnimals.length > 1){
  //         throw Exception("Animal with id ${remoteAnimal.remoteId} has duplicates");
  //       }
  //       if(localAnimals.isNotEmpty){
  //         localCopy = localAnimals.first;
  //       }
  //     }
  //     if(localCopy != null){
  //       final medications = await batchMedicationUpsert(remoteAnimal.medicationHistory);
  //       final vaccinations = await batchVaccinationUpsert(remoteAnimal.vaccinationHistory);

  //       localCopy.medicationHistory
  //         ..clear()
  //         ..addAll(medications);
  //       localCopy.vaccinationHistory
  //         ..clear()
  //         ..addAll(vaccinations);

  //       localCopy.name = remoteAnimal.name;
  //       localCopy.age = remoteAnimal.age;
  //       localCopy.status = remoteAnimal.status;
  //       localCopy.sex = remoteAnimal.sex;
  //       localCopy.species = remoteAnimal.species;
  //       localCopy.location = remoteAnimal.location;
  //       localCopy.sterilizatonDate = remoteAnimal.sterilizationDate;
  //       localCopy.coatColor = remoteAnimal.coatColor;
  //       localCopy.traitsAndPersonality = remoteAnimal.traitsAndPersonality;
  //       localCopy.notes = remoteAnimal.notes;

  //       if(remoteAnimal.profileImageLink != null && remoteAnimal.profileImageLink != localCopy.profileImageLink){
  //         final response = await http.get(Uri.parse(remoteAnimal.profileImageLink!));
  //         final  imageFile = await LocalFileRepository.saveFile(
  //           remoteAnimal.remoteId,
  //           response.bodyBytes,
  //           folders: [remoteAnimal.remoteId!],
  //           isPublic: false
  //         );
  //         imageList.add(imageFile);
  //         // if(localCopy.profileImagePath != null){
  //         //   localCopy.imagePaths.add(localCopy.profileImagePath!);
  //         // }
  //       }
  //       await _db.localAnimalModels.put(localCopy);
  //     }else{

  //     }
  //   }catch(err){
  //     TLogger.error("Local storage level upsert animal failed ${err.toString()}");
  //     rethrow;
  //   }
  // }


  Future<List<LocalAnimalMedicationRecord>> batchMedicationUpsert(List<AnimalMedicationDTO> medicationList) async{
    try{
      final List<LocalAnimalMedicationRecord> localMedRecords = [];
      for(var i = 0; i < medicationList.length; i++){
        final medRecord = medicationList[i];
        final existing = await _db.localAnimalMedicationRecords.filter()
          .remoteIdEqualTo(medRecord.remoteId)
          .findFirst();
        if(existing != null){
          existing.medicationName = medRecord.medicationName;
          existing.dosage = medRecord.dosage;
          existing.route = medRecord.route;
          existing.dateGiven = medRecord.dateGiven;
          existing.durationInDays = medRecord.durationInDays;
          existing.reason = medRecord.reason;
          existing.prescribedBy = medRecord.prescribedBy;
          existing.notes = medRecord.notes;

          localMedRecords.add(existing);
        }else{
          localMedRecords.add(medRecord.toLocalModel());
        }
      }

      await _db.localAnimalMedicationRecords.putAll(localMedRecords);
      return localMedRecords;
    }catch(err){
      TLogger.info("Failed to upsert list of animal medications");
      rethrow;
    }
  }

  Future<List<LocalAnimalVaccinationRecord>> batchVaccinationUpsert(List<AnimalVaccinationDTO> vaxList) async{
    try{
      final List<LocalAnimalVaccinationRecord> localVaxRecords =[];
      for(var i = 0; i < vaxList.length; i++){
        final vaxRecord = vaxList[i];
        final existing = await _db.localAnimalVaccinationRecords.filter()
          .remoteIdEqualTo(vaxRecord.remoteId)
          .findFirst();
        if(existing != null){
          existing.vaccineName = vaxRecord.vaccineName;
          existing.dateGiven = vaxRecord.dateGiven;
          existing.doseNumber = vaxRecord.doseNumber;
          existing.nextDuedate = vaxRecord.nextDueDate;
          existing.administeredBy = vaxRecord.administeredBy;
          existing.batchNumber = vaxRecord.batchNumber;
          existing.expiryDate = vaxRecord.expiryDate;
          existing.route = vaxRecord.route;
          existing.notes = vaxRecord.notes;
          localVaxRecords.add(existing);
        }else{
          localVaxRecords.add(vaxRecord.toLocalModel());
        }
      }
      await _db.localAnimalVaccinationRecords.putAll(localVaxRecords);
      return localVaxRecords;
    }catch(err){
      TLogger.error("Failed to upsert list of animal vaccinations");
      rethrow;
    }

  }
}