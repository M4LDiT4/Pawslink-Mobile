import 'dart:convert';

import 'package:mobile_app_template/core/enums/health_status.dart';
import 'package:mobile_app_template/core/utils/helpers/enum_helper.dart';
import 'package:mobile_app_template/domain/entities/animal_medication_dto.dart';
import 'package:mobile_app_template/domain/entities/animal_vaccination_dto.dart';
import 'package:mobile_app_template/domain/entities/base_dto.dart';
import 'package:mobile_app_template/domain/models/local_monthly_adoption_update.dart';

class MonthlyAdoptionUpdateDTO extends BaseDto<LocalMonthlyAdoptionUpdate>{
  String adoptionId;
  DateTime month;
  AnimalHealthStatus healthStatus;
  List<String> behaviorNotes;
  List<AnimalVaccinationDTO> vaccinationUpdates;
  List<AnimalMedicationDTO> medicationUpdates;
  List<String> localImagePaths;
  List<String> remoteImageUrls;
  List<String> remarks; 

  MonthlyAdoptionUpdateDTO({
    super.localId,
    super.remoteId,
    required this.month,
    required this.adoptionId,
    required this.healthStatus,
    required this.behaviorNotes,
    this.vaccinationUpdates = const [],
    this.medicationUpdates = const [],
    this.localImagePaths = const [],
    this.remoteImageUrls = const [],
    this.remarks = const []
  });


  @override
  LocalMonthlyAdoptionUpdate toLocalModel(){
    return LocalMonthlyAdoptionUpdate()
      ..remoteId = remoteId
      ..adoptionId = adoptionId
      ..month = month
      ..healthStatus = healthStatus
      ..behaviorNotes = behaviorNotes
      ..localImagePaths = localImagePaths
      ..remoteImageUrls =  remoteImageUrls
      ..remarks = remarks
      ..medicationUpdates.addAll(medicationUpdates.map(
          (item) => item.toLocalModel()
        ).toList()
      )
      ..vaccinationUpdates.addAll(vaccinationUpdates.map(
          (item) => item.toLocalModel()
        ).toList()
      );
  }

  @override 
  Map<String, dynamic> toMap(){
    return {
      '_id': remoteId,
      'adoptionId': adoptionId,
      'month': month.toIso8601String(),
      'healthStatus': healthStatus.name,
      'behaviorNotes': jsonEncode(behaviorNotes),
      'imgUrls': jsonEncode(remoteImageUrls),
      'remarks': jsonEncode(remarks),
      'medicationUpdates': jsonEncode(
        medicationUpdates.map(
          (item) => item.toMap()
        ).toList()
      ),
      'vaccinationUpdates': jsonEncode(
        vaccinationUpdates.map(
          (item) => item.toMap()
        ).toList()
      )
    };
  }

  factory MonthlyAdoptionUpdateDTO.fromMap(Map<String, dynamic> map) {
    return MonthlyAdoptionUpdateDTO(
      remoteId: map['_id'] as String,
      adoptionId: map['adoptionId'] as String,
      month: DateTime.parse(map['month']),
      healthStatus: TEnumHelper.enumFromString(AnimalHealthStatus.values, map['healthStatus']),
      behaviorNotes: List<String>.from(jsonDecode(map['behaviorNotes'] ?? '[]')),
      remoteImageUrls: List<String>.from(jsonDecode(map['imgUrls'] ?? '[]')),
      remarks: List<String>.from(jsonDecode(map['remarks'] ?? '[]')),
      medicationUpdates: (jsonDecode(map['medicationUpdates'] ?? '[]') as List)
          .map((item) => AnimalMedicationDTO.fromMap(item))
          .toList(),
      vaccinationUpdates: (jsonDecode(map['vaccinationUpdates'] ?? '[]') as List)
          .map((item) => AnimalVaccinationDTO.fromMap(item))
          .toList(),
    );
  }
  factory MonthlyAdoptionUpdateDTO.fromLocalModel(LocalMonthlyAdoptionUpdate local) {
  return MonthlyAdoptionUpdateDTO(
    localId: local.id,
    remoteId: local.remoteId,
    adoptionId: local.adoptionId,
    month: local.month,
    healthStatus: local.healthStatus,
    behaviorNotes: local.behaviorNotes,
    localImagePaths: local.localImagePaths,
    remoteImageUrls: local.remoteImageUrls,
    remarks: local.remarks,
    medicationUpdates: local.medicationUpdates
        .map((item) => AnimalMedicationDTO.fromLocalMedicationHistory(item))
        .toList(),
    vaccinationUpdates: local.vaccinationUpdates
        .map((item) => AnimalVaccinationDTO.fromLocalAnimalVaccinationRecord(item))
        .toList(),
  );
}

}