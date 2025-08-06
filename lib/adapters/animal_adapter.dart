import 'dart:convert';

import 'package:mobile_app_template/adapters/animal_medication_adapter.dart';
import 'package:mobile_app_template/adapters/animal_vaccination_adapter.dart';
import 'package:mobile_app_template/core/enums/animal_sex.dart';
import 'package:mobile_app_template/core/enums/animal_species.dart';
import 'package:mobile_app_template/core/enums/animal_status.dart';
import 'package:mobile_app_template/data/local_storage/isar/model/animal_vax_history_model.dart';
import 'package:mobile_app_template/models/local_animal_model.dart';

/// ## AnimalAdapter
/// This class is used to represent an animal in the application.
/// ### Notes:
/// - When adding a new animal, `remoteId` and `localId` are null.
/// - When the animal is saved to the database, `localId` is assigned by the database.
/// - When the animal is uploaded to the server, `remoteId` is assigned by the server.
/// - `localId` must be populated when the animals are fetched from the local database.
/// - `remoteId` must be populated when the animals are fetched from the remote database.
/// - `localId` is used to reference the animal in the local database.
/// - `remoteId` is used to reference the animal in the remote database.
/// - `imageUrls` and `imagePaths` are used to store the URLs and paths of the animal's images.
/// - `profileImageLink` and `profileImagePath` are used to store the URL and path of the animal's profile image.
/// - `coatColor`, `notes`, and `traits` are lists of strings that can be used to store multiple values.
/// - `age` is optional and can be null if the age is not known.
/// - `status`, `species`, and `sex` are enums that can be used to represent the animal's status, species 
/// - `medicationHistory` is the list of [AnimalMedicationAdapter] the animal have. Defaults to empty array
/// - `vaccinationHistory is the list of [AnimalVaccinationAdapter] the animal have. Defaults to an empty array
class AnimalAdapter {
  int? localId;
  String? remoteId;
  String name;
  AnimalSex sex;
  int? age;
  AnimalStatus status;
  AnimalSpecies species;
  String location;
  DateTime? sterilizationDate;

  List<String> coatColor;
  List<String> notes;
  List<String> traitsAndPersonality;

  //note that paths are local 
  //links are remote
  List<String> imageUrls;
  String? profileImageLink;
  List<String> imagePaths;
  String? profileImagePath;

  //health history
  List<AnimalMedicationAdapter> medicationHistory;
  List<AnimalVaccinationAdapter> vaccinationHistory;

  AnimalAdapter({
    this.remoteId,
    this.localId,
    required this.name,
    required this.sex,
    this.age,
    required this.status,
    required this.species,
    required this.location,
    this.sterilizationDate,
    this.coatColor = const [],
    this.notes = const [],
    this.traitsAndPersonality = const [],
    this.imageUrls = const [],
    this.profileImageLink,
    this.imagePaths = const [],
    this.profileImagePath,
    this.medicationHistory = const [],
    this.vaccinationHistory = const []
  });

  /// removes the current value of the `vaccinationHistory` and replaces it with `vaxList`
  /// ### Parameters
  /// - **[vaxList]** - new list of [AnimalVaccinationAdapter] that will replace the current `vaccinationHistory`
  void setVaccinationHistory(List<AnimalVaccinationAdapter> vaxList){
    vaccinationHistory = vaxList;
  }

  /// inserts new items to the `vaccinationHistory`
  /// ### Paramters
  /// - **[vaxList]** - list of [AnimalVaccinationAdapter] that will be added to the current `vaccinationHistory`
  void insertVaccinationHisory(List<AnimalVaccinationAdapter> vaxList){
    vaccinationHistory.addAll(vaxList);
  }

  void setMedicationHistory(List<AnimalMedicationAdapter> medList){
    medicationHistory = medList;
  }

  void insertMedicaitonHistory(List<AnimalMedicationAdapter> medList){
    medicationHistory.addAll(medList);
  }

  factory AnimalAdapter.fromLocalAnimalModel(LocalAnimalModel localAnimal){
    return AnimalAdapter(
      localId: localAnimal.id,
      name: localAnimal.name, 
      age: localAnimal.age,
      sex: localAnimal.sex, 
      status: localAnimal.status, 
      species: localAnimal.species, 
      location: localAnimal.location,
      coatColor: localAnimal.coatColor,
      traitsAndPersonality: localAnimal.traitsAndPersonality,
      notes: localAnimal.coatColor,
      imagePaths: localAnimal.imagePaths,
      profileImagePath: localAnimal.profileImagePath,
      
      medicationHistory: localAnimal.medicationHistory.map(
        (item)=> AnimalMedicationAdapter.fromLocalMedicationHistory(item)
      ).toList(),
      vaccinationHistory: localAnimal.vaccinationHistory.map(
        (item)=> AnimalVaccinationAdapter.fromLocalAnimalVaccinationRecord(item)
      ).toList()
    );
  }

  LocalAnimalModel toLocalAnimalModel(){
    final animal = LocalAnimalModel()
      ..name = name
      ..sex = sex
      ..age = age
      ..status = status
      ..species = species
      ..location = location
      ..sterilizatonDate = sterilizationDate
      ..coatColor = coatColor
      ..notes = notes
      ..traitsAndPersonality = traitsAndPersonality
      ..profileImagePath = profileImagePath
      ..imagePaths = imagePaths;

    animal.medicationHistory.addAll(medicationHistory.map(
      (item) => item.toLocalMedicationRecord()
    ).toList());

    animal.vaccinationHistory.addAll(vaccinationHistory.map(
        (item) => item.toLocalAnimalVaccinationRecord()
      ).toList()
    );
    return animal;
  }

  Map<String, dynamic> toMap(){
    final Map<String, dynamic> animal = {
      'name': name,
      'sex': sex.label,
      'status': status.label,
      'species': status.label,
      'location': location,
      'coatColor': jsonEncode(coatColor),
      'notes': jsonEncode(notes),
      'traitsAndPersonality': jsonEncode(traitsAndPersonality),
      'medicationHistory': jsonEncode(
          medicationHistory.map(
            (item) => item.toMap()
          ).toList()
        ),
      'vaccinationHistory': jsonEncode(
        vaccinationHistory.map(
          (item) =>item.toMap()
        ).toList()
      )
    };

    if(age != null){
      animal['age'] = age;
    }

    if(sterilizationDate != null){
      animal['sterilizationDate'] = sterilizationDate;
    }

    return animal;
  }

}
