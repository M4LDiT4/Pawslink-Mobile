import 'dart:convert';

import 'package:mobile_app_template/domain/entities/animal_medication_dto.dart';
import 'package:mobile_app_template/domain/entities/animal_vaccination_dto.dart';
import 'package:mobile_app_template/domain/entities/base_dto.dart';
import 'package:mobile_app_template/core/enums/animal_sex.dart';
import 'package:mobile_app_template/core/enums/animal_species.dart';
import 'package:mobile_app_template/core/enums/animal_status.dart';
import 'package:mobile_app_template/core/utils/helpers/list_helpers.dart';
import 'package:mobile_app_template/domain/models/image_file_mapping.dart';
import 'package:mobile_app_template/domain/models/local_animal_model.dart';

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
class AnimalDTO extends BaseDto{
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
  String? profileImagePath;

  //health history
  List<AnimalMedicationDTO> medicationHistory;
  List<AnimalVaccinationDTO> vaccinationHistory;

  AnimalDTO({
    super.remoteId,
    super.localId,
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
    this.profileImagePath,
    this.medicationHistory = const [],
    this.vaccinationHistory = const []
  });

  /// removes the current value of the `vaccinationHistory` and replaces it with `vaxList`
  /// ### Parameters
  /// - **[vaxList]** - new list of [AnimalVaccinationDTO] that will replace the current `vaccinationHistory`
  void setVaccinationHistory(List<AnimalVaccinationDTO> vaxList){
    vaccinationHistory = vaxList;
  }

  /// inserts new items to the `vaccinationHistory`
  /// ### Paramters
  /// - **[vaxList]** - list of [AnimalVaccinationDTO] that will be added to the current `vaccinationHistory`
  void insertVaccinationHisory(List<AnimalVaccinationDTO> vaxList){
    vaccinationHistory.addAll(vaxList);
  }

  /// removes the current value of the `medicationHistory` and replaces it with `medList`
  /// ### Parameters
  /// - **[medList]**: new [List] of [AnimalMedicationDTO] that will replace the current `medicationHistory`
  void setMedicationHistory(List<AnimalMedicationDTO> medList){
    medicationHistory = medList;
  }

  /// inserts new items to the `medicationHistory
  /// ### Parameters
  /// - **[medList]**: a [List] of [AnimalMedicationDTO] that will be added to the current `medicationHistory`
  void insertMedicationHistory(List<AnimalMedicationDTO> medList){
    medicationHistory.addAll(medList);
  }

  /// Factory method to generate [AnimalDTO] from the [LocalAnimalModel]
  /// ### Parameters
  /// - **[localAnimal]**: instance of local data of type [LocalAnimalModel] that will be converted
  /// to [AnimalAdapter]
  factory AnimalDTO.fromLocalAnimalModel(LocalAnimalModel localAnimal){
    return AnimalDTO(
      remoteId: localAnimal.remoteId,
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
      profileImagePath: localAnimal.profileImagePath,
      
      medicationHistory: localAnimal.medicationHistory.map(
        (item)=> AnimalMedicationDTO.fromLocalMedicationHistory(item)
      ).toList(),
      vaccinationHistory: localAnimal.vaccinationHistory.map(
        (item)=> AnimalVaccinationDTO.fromLocalAnimalVaccinationRecord(item)
      ).toList()
    );
  }
  /// Converts [AnimalAdapter] to [LocalAnimalModel]
  @override
  LocalAnimalModel toLocalModel(){
    final animal = LocalAnimalModel()
      ..remoteId = remoteId
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
      ..profileImageLink = profileImageLink;


    animal.medicationHistory.addAll(medicationHistory.map(
      (item) => item.toLocalModel()
    ).toList());

    animal.vaccinationHistory.addAll(vaccinationHistory.map(
        (item) => item.toLocalModel()
      ).toList()
    );
    animal.imagePaths.addAll(
      imageUrls.map((item){
        final pathMap = ImageFileMapping()
          ..parentRemoteId = remoteId!
          ..remoteLink = item;
        return pathMap;
      }).toList()
    );
    return animal;
  }
  @override
  /// Converts [AnimalDTO] to [Map] of key type [String] and value type [dynamic]
  /// ### Notes:
  /// - use this representation for API requests like form data or JSON
  Map<String, String> toMap(){
    final Map<String, String> animal = {
      'name': name,
      'sex': sex.name,
      'status': status.name,
      'species': species.name,
      'location': location,
      'coatColor': jsonEncode(coatColor),
      'notes': jsonEncode(notes),
      'traitsAndPersonality': jsonEncode(traitsAndPersonality),
      'medicationRecords': jsonEncode(
          medicationHistory.map(
            (item) => item.toMap()
          ).toList()
        ),
      'vaccinationRecords': jsonEncode(
        vaccinationHistory.map(
          (item) =>item.toMap()
        ).toList()
      )
    };

    if(age != null){
      animal['age'] = age!.toString();
    }

    if(sterilizationDate != null){
      animal['sterilizationDate'] = sterilizationDate!.toIso8601String();
    }

    if(remoteId != null){
      animal['_id'] = remoteId!;
    }

    return animal;
  }

  /// Converts [Map] of key type [String] and value type [dynamic] to [AnimalDTO]
  factory AnimalDTO.fromMap(Map<String, dynamic> animalJSON){

    final medicationRecordList = (jsonDecode(animalJSON['medicationRecords'] ?? "[]") as List)
      .map(
        (item) => AnimalMedicationDTO.fromMap(item)
      ).toList();
    
    final vaccinationRecordList = (jsonDecode(animalJSON['vaccinationRecords']?? '[]') as List)
      .map(
        (item) => AnimalVaccinationDTO.fromMap(item)
      ).toList();

    final animal = AnimalDTO(
      remoteId: animalJSON['_id'],
      name: animalJSON['name'] as String,
      age: animalJSON['age'] != null? animalJSON['age'] as int: null,
      sex: animalSexFromString(animalJSON['sex']),
      status: animalStatusFromString(animalJSON['status'] as String),
      species: animalSpeciesFromString(animalJSON['species'] as String),
      location: animalJSON['location'],
      coatColor: TListHelpers.parseStringList(animalJSON['coatColor'] ?? '[]'),
      notes: TListHelpers.parseStringList(animalJSON['notes']?? '[]'),
      traitsAndPersonality: TListHelpers.parseStringList(animalJSON['traitsAndPersonality'] ?? '[]'),
      medicationHistory: medicationRecordList,
      vaccinationHistory: vaccinationRecordList,
      profileImageLink: animalJSON['profileImage'],
      imageUrls: TListHelpers.parseStringList(animalJSON['imgUrls'] ?? '[]'),
    );

    return animal;
  }

}
