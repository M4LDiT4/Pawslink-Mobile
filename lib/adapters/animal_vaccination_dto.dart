import 'dart:convert';

import 'package:mobile_app_template/core/utils/helpers/list_helpers.dart';
import 'package:mobile_app_template/models/local_animal_vaccination_history.dart';

class AnimalVaccinationDTO {
  int? localId;
  String? remoteId;

  int? animalLocalId;
  String? animalRemoteId;

  String vaccineName;
  DateTime dateGiven;
  int doseNumber;
  DateTime? nextDueDate;
  String administeredBy;
  int batchNumber;
  DateTime expiryDate;
  String route;
  List<String> notes;

  AnimalVaccinationDTO({
    this.localId,
    this.remoteId,
    this.animalLocalId,
    this.animalRemoteId,
    required this.vaccineName,
    required this.dateGiven,
    required this.doseNumber,
    this.nextDueDate,
    required this.administeredBy,
    required this.batchNumber,
    required this.expiryDate,
    required this.route,
    this.notes = const []
  });

  factory AnimalVaccinationDTO.fromLocalAnimalVaccinationRecord(LocalAnimalVaccinationRecord localVax){
    return AnimalVaccinationDTO(
      localId: localVax.id,
      vaccineName: localVax.vaccineName, 
      dateGiven: localVax.dateGiven, 
      doseNumber: localVax.doseNumber, 
      nextDueDate: localVax.nextDuedate,
      administeredBy: localVax.administeredBy, 
      batchNumber: localVax.batchNumber, 
      expiryDate: localVax.expiryDate, 
      route: localVax.route,
      notes: localVax.notes
    );
  }

  LocalAnimalVaccinationRecord toLocalAnimalVaccinationRecord(){
    return LocalAnimalVaccinationRecord()
      ..vaccineName = vaccineName
      ..dateGiven = dateGiven
      ..doseNumber = doseNumber
      ..nextDuedate = nextDueDate
      ..administeredBy = administeredBy
      ..batchNumber = batchNumber
      ..expiryDate = expiryDate
      ..route = route
      ..notes = notes;
  }

  Map<String, dynamic> toMap(){
    final Map<String, dynamic> animalVaxRecord =  {
      "vaccineName" : vaccineName,
      "dateGiven" : dateGiven.toIso8601String(),
      "doesNumber" : doseNumber,
      "administeredBy": administeredBy,
      "batchNumber": batchNumber,
      "expiryDate": expiryDate.toIso8601String(),
      "notes": jsonEncode(notes)
    };

    if(nextDueDate != null){
      animalVaxRecord['nextDueDate'] = nextDueDate;
    }

    return animalVaxRecord;
  }

  factory AnimalVaccinationDTO.fromMap(Map<String, dynamic> map) {
    return AnimalVaccinationDTO(
      vaccineName: map['vaccineName'] ?? '',
      dateGiven: DateTime.parse(map['dateGiven']),
      doseNumber: map['doesNumber'] ?? 0,
      nextDueDate: map['nextDueDate'] != null ? DateTime.parse(map['nextDueDate']) : null,
      administeredBy: map['administeredBy'] ?? '',
      batchNumber: map['batchNumber'] ?? 0,
      expiryDate: DateTime.parse(map['expiryDate']),
      route: map['route'] ?? '',
      notes: TListHelpers.parseStringList(map['notes']),
    );
  }
}