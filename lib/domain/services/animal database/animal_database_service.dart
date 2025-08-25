// initialize tlhis when you are in add animal section
import 'dart:io';
import 'package:isar/isar.dart';
import 'package:mobile_app_template/core/enums/animal_sex.dart';
import 'package:mobile_app_template/core/enums/animal_species.dart';
import 'package:mobile_app_template/core/enums/animal_status.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';
import 'package:mobile_app_template/data/local_storage/isar/helpers/filter_helper.dart';
import 'package:mobile_app_template/domain/entities/animal_dto.dart';
import 'package:mobile_app_template/domain/repositories/api/animal_api_repository.dart';
import 'package:mobile_app_template/domain/repositories/local/local_animal_repository.dart';
import 'package:mobile_app_template/domain/services/local/animal_repository.dart';
import 'package:mobile_app_template/domain/services/local_storage/local_secure_storage.dart';
import 'package:mobile_app_template/network/operation_response.dart';

class AnimalDatabaseService {
  final AnimalApiRepository _cloudRepo;
  final LocalAnimalRepository _localRepo;
  final LocalSecureStorageService _localStore = LocalSecureStorageService();

  AnimalDatabaseService({
    required AnimalApiRepository animalApiService,
    required LocalAnimalRepository localAnimalRepo
  }): _cloudRepo = animalApiService,
      _localRepo = localAnimalRepo;


  Future<OperationResponse<AnimalDTO>> saveAnimalLocally(AnimalDTO animalDto, File profilePicture)async{
    try{
      final response = await _localRepo.addAnimal(animalDto, profilePicture);
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
      // update the local data with the data from the cloud
      if(response.isSuccessful && response.data != null){
        await _localRepo.updateAnimals([response.data!]);
        final localAnimal = await _localRepo.getAnimalsByBSONId(response.data!.remoteId!);
      }
      return response;
    }catch(err, stack){
      TLogger.error("Failed to save animal to cloud: ${err.toString()}");
      TLogger.debug('Stack:\n$stack');
      return OperationResponse<AnimalDTO>.failedResponse(
        message: 'Failed to save animal to cloud'
      );
    }
  }

  Future<OperationResponse<List<AnimalDTO>>> getLocalAnimals({
    String? name,
    FilterConditionType? nameCondition,  
    String? location,
    FilterConditionType? locationCondition, 

    AnimalSex? sex,
    AnimalSpecies? species,
    AnimalStatus? status,

    int? age,
    FilterConditionType? ageCondition,   

    AnimalSortBy? sortBy,
    Sort? sortOrder,

    int? page,
    int? itemsPerPage,

  }) async {
    final result = await _localRepo.getAnimals(
      name: _toFilter(name, strategy: nameCondition ?? FilterConditionType.equalTo),
      location: _toFilter(location, strategy: locationCondition ?? FilterConditionType.equalTo),
      sex: _toFilter(sex),      // enums always equalTo
      species: _toFilter(species),
      status: _toFilter(status),
      age: _toFilter(age, strategy: ageCondition ?? FilterConditionType.equalTo),
      sortBy: sortBy,
      sortOrder: sortOrder,
      pageNum: page,
      itemsPerPage: itemsPerPage
    );

    if(result.data == null){
      return OperationResponse(
        isSuccessful: true, 
        statusCode: 200,
        data: null,
        message: 'No animals found.'
      );
    }
    final animals = result.data!.map((item) => AnimalDTO.fromLocalAnimalModel(item)).toList();
    return OperationResponse(
      isSuccessful: true, 
      statusCode: 200,
      data: animals
    );
  } 

  // get using api


  DynamicIsarFilter<T>? _toFilter<T>(
    T? value, {
    FilterConditionType strategy = FilterConditionType.equalTo,
  }) {
    if (value == null) return null;

    // Validation: make sure only valid strategies apply to certain types
    if (value is String) {
      // Strings: allow contains, startsWith, endsWith, equalTo
      if (strategy == FilterConditionType.greaterThan ||
          strategy == FilterConditionType.lessThan) {
        throw ArgumentError(
            "Invalid strategy $strategy for String. Use contains/startsWith/endsWith/equalTo instead.");
      }
    } else if (value is Enum) {
      // Enums: only equalTo makes sense
      if (strategy != FilterConditionType.equalTo) {
        throw ArgumentError(
            "Invalid strategy $strategy for Enum. Only equalTo is supported.");
      }
    } else if (value is num) {
      // Numbers: allow equalTo, greaterThan, lessThan, between
      if (strategy == FilterConditionType.contains ||
          strategy == FilterConditionType.startsWith ||
          strategy == FilterConditionType.endsWith) {
        throw ArgumentError(
            "Invalid strategy $strategy for numeric values. Use equalTo/greaterThan/lessThan/between instead.");
      }
    }

    return DynamicIsarFilter<T>(
      value: value,
      strategy: strategy,
    );
  }

  // local counts
  Future<OperationResponse<Map<String, int>>> getAnimalStatusSummaryData()async{
    try{
      final Map<String, Future<OperationResponse<int>>> futureMap = {
        AnimalStatus.adopted.name: _localRepo.countAnimals(status: AnimalStatus.adopted),
        AnimalStatus.onCampus.name: _localRepo.countAnimals(status: AnimalStatus.onCampus),
        AnimalStatus.owned.name: _localRepo.countAnimals(status: AnimalStatus.owned),
        AnimalStatus.transient.name: _localRepo.countAnimals(status: AnimalStatus.transient),
        AnimalStatus.rainbowBridge.name: _localRepo.countAnimals(status: AnimalStatus.rainbowBridge),
        AnimalStatus.unknown.name: _localRepo.countAnimals(status: AnimalStatus.unknown),
      };

      final results = await Future.wait(futureMap.entries.map(
        (entry) async {
          final response = await entry.value;
          return MapEntry(entry.key, response.data ?? 0);
        }
      ));
      
      final resolvedMap = Map.fromEntries(results);
      
      return OperationResponse(
        isSuccessful: true, 
        statusCode: 200,
        data: resolvedMap
      );
    }catch(err){
      TLogger.error("Failed to get general animal summary data: ${err.toString()}");
      return OperationResponse.failedResponse(
        message: "Failed to get status-based summary"
      );
    }
  }

  Future<OperationResponse<Map<String, int>>> getSpeciesSummary(AnimalSpecies species) async{
    try{
      final Map<String, Future<OperationResponse<int>>> futureMap = {
        AnimalSex.female.name: _localRepo.countAnimals(species: species, sex: AnimalSex.female),
        AnimalSex.male.name: _localRepo.countAnimals(species: species, sex: AnimalSex.male),
        AnimalSex.unknown.name: _localRepo.countAnimals(species: species, sex: AnimalSex.unknown),
        'neutered': _localRepo.countAnimals(species: species, sex: AnimalSex.male, isSterilized: true),
        'spayed': _localRepo.countAnimals(species: species, sex: AnimalSex.female, isSterilized: true),
      };
      final results = await Future.wait(
        futureMap.entries.map(
          (entry) async {
            final response = await entry.value;
            return MapEntry(entry.key, response.data ?? 0);
          }
        )
      );

      final resolvedMap = Map.fromEntries(results);

      return OperationResponse(
        isSuccessful: true, 
        statusCode: 200,
        data:resolvedMap
      );
    }catch(err){
      TLogger.error("Failed to get species (${species.name}) data : ${err.toString()}");
      return OperationResponse.failedResponse(
        message: "Failed to get species based summary"
      );
    }
  }

  Future<OperationResponse<int>> getSpeciesCount(AnimalSpecies species) async {
    try{
      final response =await _localRepo.countAnimals(species: species);
      return OperationResponse(
        isSuccessful: true, 
        statusCode: 200,
        data: response.data
      );
    }catch(err){
      TLogger.error("Failed to get count for species ${species.name}");
      return OperationResponse.failedResponse(
        message: "Failed to get the count for species ${species.toString()}"
      );
    }
  }

  Future<OperationResponse<List<AnimalDTO>>> searchAnimalByNameLocally(String query) async{
    try{
      final result = await _localRepo.searchAnimalByString(query);
      if(result.data == null){
        return OperationResponse.successfulResponse(
          message: 'No animals found'
        );
      }
      final animals = result.data!.map((animal) => AnimalDTO.fromLocalAnimalModel(animal))
        .toList();
      return OperationResponse(
        isSuccessful: true, 
        statusCode: 200,
        data: animals
      );
    }catch(err){
      TLogger.error('Error in animal database service while searching for animal with name containing $query');
      return OperationResponse.failedResponse(
        message: 'Failed to query animal $query'
      );
    }
  }

  Future<OperationResponse<AnimalDTO>> getAnimalByBSONId(String bsonId) async {
    try{
      final response = await _localRepo.getAnimalsByBSONId(bsonId);
      if(!response.isSuccessful || response.data == null){
        throw Exception("Failed to get data for bsonId $bsonId");
      }
      final animals = response.data!;
      if(animals.length > 1){
        throw Exception("BSON ID should be unique for each animal, yet returned with more than one result");
      }

      return OperationResponse(
        isSuccessful: true, 
        statusCode: 200,
        data: AnimalDTO.fromLocalAnimalModel(animals.first)
      );
    }catch(err){
      TLogger.error("Failed to get the animal with bson id $bsonId: ${err.toString()}");
      return OperationResponse.failedResponse(
        message: "An Error occured while retrieving animal data"
      );
    }
  }
  Future<OperationResponse> syncAnimals() async {
    try {
      // 1. Get the last update date stored locally
      final lastUpdateDateString = await _localStore.getData(LocalSecureStorageService.lastUpdate);
      DateTime? lastUpdateDate;
      if (lastUpdateDateString != null) {
        lastUpdateDate = DateTime.tryParse(lastUpdateDateString);
      }

      // 2. Get updates from server
      final response = await _cloudRepo.getUpdates(lastUpdateDate);

      if (response.isEmpty) {
        return OperationResponse.successfulResponse(
          message: "No new updates available"
        );
      }

      TLogger.debug("Response: ${response.toString()}");

      // 3. Save to local database
      await _localRepo.updateAnimals(response);

      // 4. Get the last updated animal safely
      final lastAnimal = response.last;

      if (lastAnimal.updatedAt != null) {
        await _localStore.saveData(
          LocalSecureStorageService.lastUpdate,
          lastAnimal.updatedAt!.toIso8601String(),
        );
      }

      return OperationResponse.successfulResponse(
        message: "Updated ${response.length} animals"
      );
    } catch (err) {
      TLogger.error("Failed to sync animals: ${err.toString()}");
      return OperationResponse.failedResponse(
        message: "Something went wrong while checking for updates"
      );
    }
  }


  Future<OperationResponse<int>> checkIfUpdatesAvailable()  async{
    try{
      final time = await _localStore.getData(LocalSecureStorageService.lastUpdate);
      final response = await _cloudRepo.checkIfUpdatesAvailable(time != null ? DateTime.tryParse(time) : null);

      return OperationResponse(
        isSuccessful: true, 
        statusCode: 200,
        data: response
      );
    }catch(err){
      TLogger.error("Service level failed to check if updates available ${err.toString()}");
      return OperationResponse.failedResponse(
        message: "Unexpected error occured while getting updates for animals availability"
      );
    }
  }
}