import 'dart:convert';

import 'package:mobile_app_template/domain/entities/base_dto.dart';
import 'package:mobile_app_template/core/utils/helpers/list_helpers.dart';
import 'package:mobile_app_template/domain/models/local_animal_medication_record.dart';

/// ## AnimalMedicationAdopter
/// This class is used to adapt the data structure for animal medication records.
/// ### Notes:
/// - when creating a new medication record, `localId` and `remoteId` are null.
/// - when the medication is saved to the database, `localId` is assigned by the database.
/// - when the medication is uploaded to the server, `remoteId` is assigned by the server.
/// - `localId` must be populated when the medications are fetched from the local database.
/// - `remoteId` must be populated when the medications are fetched from the remote database.
/// - `localAnimalId` and `remoteAnimalId` are used to reference the animal
/// - `localId` and `remoteId` are used to reference the medication in the local and remote databases respectively.
/// - `localAnimalId` and `remoteAnimalId` are used to reference the animal associated with the medication.
/// - `medicationName`, `dosage`, `route`, `dateGiven`, `durationInDays`, `reason`, and `prescribedBy`
///   are required fields that describe the medication details.
/// - `notes` is an optional field that can store additional information about the medication.

class AnimalMedicationDTO extends BaseDto<LocalAnimalMedicationRecord>{

  int? localAnimalId;
  String? remoteAnimalId;

  String medicationName;
  String dosage;
  String route;
  DateTime dateGiven;
  int durationInDays;
  String reason;
  String prescribedBy;
  List<String> notes;

  AnimalMedicationDTO({
    super.localId,
    super.remoteId,
    this.localAnimalId,
    this.remoteAnimalId,
    required this.medicationName,
    required this.dosage,
    required this.route,
    required this.dateGiven,
    required this.durationInDays,
    required this.reason,
    required this.prescribedBy,
    this.notes = const [],
  });

  factory AnimalMedicationDTO.fromLocalMedicationHistory(LocalAnimalMedicationRecord localMedHist){
    return AnimalMedicationDTO(
      localId: localMedHist.id,
      medicationName: localMedHist.medicationName, 
      dosage: localMedHist.dosage, 
      route: localMedHist.route, 
      dateGiven: localMedHist.dateGiven, 
      durationInDays: localMedHist.durationInDays, 
      reason: localMedHist.reason, 
      prescribedBy: localMedHist.prescribedBy,
      notes: localMedHist.notes
    );
  }

  @override
  LocalAnimalMedicationRecord toLocalModel(){
    return LocalAnimalMedicationRecord()
      ..medicationName = medicationName
      ..dosage = dosage
      ..route = route
      ..dateGiven = dateGiven
      ..durationInDays = durationInDays
      ..reason = reason
      ..prescribedBy = prescribedBy
      ..notes = notes;
  }
  @override
  Map<String, dynamic> toMap(){
    return {
      'medicationName': medicationName,
      'dosage': dosage,
      'route': route,
      'dateGiven': dateGiven.toIso8601String(),
      'durationInDays': durationInDays,
      'reason': reason,
      'prescribedBy': prescribedBy,
      'notes': jsonEncode(notes)
    };
  }

  factory AnimalMedicationDTO.fromMap(Map<String, dynamic> map) {
    return AnimalMedicationDTO(
      medicationName: map['medicationName'] ?? '',
      dosage: map['dosage'] ?? '',
      route: map['route'] ?? '',
      dateGiven: DateTime.parse(map['dateGiven']),
      durationInDays: map['durationInDays'] ?? 0,
      reason: map['reason'] ?? '',
      prescribedBy: map['prescribedBy'] ?? '',
      notes: TListHelpers.parseStringList(map['notes'])
    );
  }
}