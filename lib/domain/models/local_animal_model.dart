
import 'package:isar/isar.dart';
import 'package:mobile_app_template/core/enums/animal_sex.dart';
import 'package:mobile_app_template/core/enums/animal_species.dart';
import 'package:mobile_app_template/core/enums/animal_status.dart';
import 'package:mobile_app_template/domain/models/animal_image_map.dart';
import 'package:mobile_app_template/domain/models/local_animal_medication_record.dart';
import 'package:mobile_app_template/domain/models/local_animal_vaccination_history.dart';
import 'package:mobile_app_template/domain/models/time_stamp.dart';

part 'local_animal_model.g.dart';

@collection 
class LocalAnimalModel with Timestamped {
  Id id = Isar.autoIncrement;
  late String remoteId; 
  late String name;
  late int? age;
  @Enumerated(EnumType.name)
  late AnimalStatus status;
  @Enumerated(EnumType.name)
  late AnimalSex sex;
  @Enumerated(EnumType.name)
  late AnimalSpecies species;
  late String location;
  late DateTime? sterilizationDate;
  
  late List<String> coatColor;
  late List<String> traitsAndPersonality;
  late List<String> notes;

  late String? profileImagePath;
  String? profileImageLink;

  final imageMaps = IsarLinks<ImageLink>();
  final vaccinationHistory = IsarLinks<LocalAnimalVaccinationRecord>();
  final medicationHistory = IsarLinks<LocalAnimalMedicationRecord>();
}