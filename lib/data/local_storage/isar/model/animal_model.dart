
import 'package:isar/isar.dart';
import 'package:mobile_app_template/core/enums/animal_sex.dart';
import 'package:mobile_app_template/core/enums/animal_species.dart';
import 'package:mobile_app_template/core/enums/animal_status.dart';
import 'package:mobile_app_template/data/local_storage/isar/model/animal_med_history_model.dart';
import 'package:mobile_app_template/data/local_storage/isar/model/animal_vax_history_model.dart';
import 'package:mobile_app_template/data/local_storage/save_status.dart';

part 'animal_model.g.dart';

@collection
class Animal{
  Id id = Isar.autoIncrement;
  late String bsonId;
  late String name;
  late String location;
  late int age;

  @Enumerated(EnumType.name)
  late AnimalSex sex;
  
  @Enumerated(EnumType.name)
  late AnimalSpecies species;

  @Enumerated(EnumType.name)
  late AnimalStatus status;

  late List<String>? coatColor;

  late List<String>? notes;

  late  List<String>? traitsAndPersonality;

  late String imgUrl;

  final vaxHistory = IsarLinks<AnimalVaccination>();
  final medHistory = IsarLinks<AnimalMedication>();

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  @Enumerated(EnumType.name)
  late SaveStatus saveStatus;
}
