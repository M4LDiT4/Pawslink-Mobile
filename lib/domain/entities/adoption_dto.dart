import 'dart:convert';

import 'package:mobile_app_template/core/enums/adoption_request.dart';
import 'package:mobile_app_template/core/utils/helpers/enum_helper.dart';
import 'package:mobile_app_template/domain/entities/base_dto.dart';
import 'package:mobile_app_template/domain/models/local_adoption.dart';

class AdoptionDTO extends BaseDto<LocalAdoption> {
  String animalId;
  String adopterId;
  String adoptionRequestId;
  DateTime adoptionDate;
  AdoptionRequestStatus adoptionStatus;
  List<String> notes;

  AdoptionDTO({
    super.localId,
    super.remoteId,
    required this.animalId,
    required this.adopterId,
    required this.adoptionRequestId,
    required this.adoptionDate,
    required this.adoptionStatus,
    this.notes = const []
  }){
    if(remoteId == null){
      throw ArgumentError("remoteId for AdoptionDTO should not be null");
    }
  }

  @override
  LocalAdoption toLocalModel() {
    return LocalAdoption()
      ..remoteId = remoteId!
      ..animalId = animalId
      ..adopterId = adopterId
      ..adoptionRequestId = adoptionRequestId
      ..adoptionDate = adoptionDate
      ..adoptionStatus = adoptionStatus
      ..notes = notes;
  }

  @override
  Map<String, dynamic> toMap(){
    return {
      '_id': remoteId!,
      'animalId': animalId,
      'adopterId': adopterId,
      'adoptionRequestId': adoptionRequestId,
      'adoptionDate': adoptionDate.toIso8601String(),
      'adoptionStatus': adoptionStatus.name,
      'notes': jsonEncode(notes)
    };
  }

  factory AdoptionDTO.fromMap(Map<String, dynamic> map) {
    return AdoptionDTO(
      remoteId: map['_id'] as String,
      animalId: map['animalId'] as String,
      adopterId: map['adopterId'] as String,
      adoptionRequestId: map['adoptionRequestId'] as String,
      adoptionDate: DateTime.parse(map['adoptionDate'] as String),
      adoptionStatus: TEnumHelper.enumFromString(AdoptionRequestStatus.values, map['adoptionStatus']),
      notes: List<String>.from(jsonDecode(map['notes'] ?? '[]')),
    );
  }

  factory AdoptionDTO.fromLocalModel(LocalAdoption local) {
    return AdoptionDTO(
      localId: local.id,
      remoteId: local.remoteId,
      animalId: local.animalId,
      adopterId: local.adopterId,
      adoptionRequestId: local.adoptionRequestId,
      adoptionDate: local.adoptionDate,
      adoptionStatus: local.adoptionStatus,
      notes: local.notes,
    );
  }

}