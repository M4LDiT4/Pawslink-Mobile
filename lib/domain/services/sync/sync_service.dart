
import 'package:mobile_app_template/data/local_storage/isar/model/animal_model.dart';
import 'package:mobile_app_template/domain/repositories/api/animal_api_repository.dart';
import 'package:mobile_app_template/domain/repositories/local/local_animal_repository.dart';
import 'package:mobile_app_template/domain/services/local_storage/local_secure_storage.dart';

class SyncService {
  final AnimalApiRepository _animalCloudRepo;
  final LocalAnimalRepository _animalLocalRepo;
  final LocalSecureStorageService _securedStorage;

  SyncService({
    required AnimalApiRepository animalCloudRepo,
    required LocalAnimalRepository animalLocalRepo,
    required LocalSecureStorageService securedStorage,
  }): _animalCloudRepo = animalCloudRepo,
      _animalLocalRepo = animalLocalRepo,
      _securedStorage = securedStorage;
    
}