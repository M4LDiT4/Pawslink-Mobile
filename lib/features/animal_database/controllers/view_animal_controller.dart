import 'package:isar/isar.dart';
import 'package:mobile_app_template/core/enums/animal_sex.dart';
import 'package:mobile_app_template/core/enums/animal_species.dart';
import 'package:mobile_app_template/core/enums/animal_status.dart';
import 'package:mobile_app_template/domain/services/local/animal_repository.dart';

class ViewAnimalController {
  ///filters and sorts and search
  AnimalSex? sexFilter;
  AnimalSpecies? speciesFilter;
  AnimalStatus? animalStatusFilter;
  AnimalSortBy? sortBy;

  String? searchString;
  Sort sortOrder = Sort.asc;

  
}