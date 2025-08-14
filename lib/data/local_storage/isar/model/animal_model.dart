
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

  String? profileImgUrl;

  List<String>? imgUrls = [];

  late DateTime? sterilizationDate;


  final vaxHistory = IsarLinks<AnimalVaccination>();
  final medHistory = IsarLinks<AnimalMedication>();

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  @Enumerated(EnumType.name)
  late SaveStatus saveStatus;
}

extension AnimalMapper on Animal {
  static Animal fromMap(Map<String, dynamic> map) {
    final animal = Animal()
      ..bsonId = map['_id'] ?? '' // or map['id'] depending on server setup
      ..name = map['name'] ?? ''
      ..location = map['location'] ?? ''
      ..age = map['age'] ?? 0
      ..sex = AnimalSex.values.firstWhere(
        (e) => e.name == (map['sex'] ?? 'unknown'),
        orElse: () => AnimalSex.unknown,
      )
      ..species = AnimalSpecies.values.firstWhere(
        (e) => e.name == (map['species'] ?? 'unknown'),
        orElse: () => AnimalSpecies.unknown,
      )
      ..status = AnimalStatus.values.firstWhere(
        (e) => e.name == (map['status'] ?? 'unknown'),
        orElse: () => AnimalStatus.unknown,
      )
      ..coatColor = (map['coatColor'] as List?)?.cast<String>() ?? []
      ..notes = (map['notes'] as List?)?.cast<String>() ?? []
      ..traitsAndPersonality = (map['traitsAndPersonality'] as List?)?.cast<String>() ?? []
      ..imgUrls = map['imgUrl']
      ..profileImgUrl = null
      ..createdAt = DateTime.tryParse(map['createdAt'] ?? '') ?? DateTime.now()
      ..updatedAt = DateTime.tryParse(map['updatedAt'] ?? '') ?? DateTime.now()
      ..saveStatus = SaveStatus.synced; // Assuming data from server is already synced

    return animal;
  }
}

