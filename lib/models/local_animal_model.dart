
import 'package:isar/isar.dart';
import 'package:mobile_app_template/core/enums/animal_sex.dart';
import 'package:mobile_app_template/core/enums/animal_species.dart';
import 'package:mobile_app_template/core/enums/animal_status.dart';
import 'package:mobile_app_template/models/local_animal_medication_record.dart';
import 'package:mobile_app_template/models/local_animal_vaccination_history.dart';

@collection 
class LocalAnimalModel {
  Id id = Isar.autoIncrement;
  late String? remoteId; //if null then it is saved only locally, otherwise there is a cloud copy of this
  late String name;
  late int? age;
  @Enumerated(EnumType.name)
  late AnimalStatus status;
  @Enumerated(EnumType.name)
  late AnimalSex sex;
  @Enumerated(EnumType.name)
  late AnimalSpecies species;
  late String location;
  late DateTime? sterilizatonDate;
  
  late List<String> coatColor;
  late List<String> traitsAndPersonality;
  late List<String> notes;

  late String? profileImagePath;
  late List<String> imagePaths;

  final vaccinationHistory = IsarLinks<LocalAnimalVaccinationRecord>();
  final medicationHistory = IsarLinks<LocalAnimalMedicationRecord>();
}