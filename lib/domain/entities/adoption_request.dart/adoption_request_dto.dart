import 'dart:convert';

import 'package:mobile_app_template/domain/entities/base_dto.dart';
import 'package:mobile_app_template/core/enums/adoption_request.dart';
import 'package:mobile_app_template/domain/models/local_adoption_request.dart';

class AdoptionRequestDTO extends BaseDto<LocalAdoptionRequest> {
  String animalId; // this is not nullable as the data should be from the cloud database
  String userId; //this is not nullable as the data should be from the cloud database
  String firstName;
  String lastName;
  int age;
  bool isStudent;
  String contactNumber;
  String emailAddress;
  String facebookLink;
  String completeAddress;
  String completeCurrentAddress;
  int currenPetCount;
  int petOwnershipDuration;
  int oldestLivingPetAge;
  bool sterilizationAwareness;
  bool adoptedSterilizationWillingness;
  String? regularVetClinic;
  String adoptedAccommodation;
  String housingType;
  String restraintMethod;
  List<String> basicNecessities;
  String petActivity;
  String referralSource;
  String idImageUrl;
  bool agreedToTerms;
  AdoptionRequestStatus adoptionStatus;


  AdoptionRequestDTO({
    super.localId,
    required super.remoteId,
    required this.animalId,
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.isStudent,
    required this.contactNumber,
    required this.emailAddress,
    required this.facebookLink,
    required this.completeAddress,
    required this.completeCurrentAddress,
    required this.currenPetCount,
    required this.petOwnershipDuration,
    required this.oldestLivingPetAge,
    required this.sterilizationAwareness,
    required this.adoptedSterilizationWillingness,
    this.regularVetClinic,
    required this.adoptedAccommodation,
    required this.housingType,
    required this.restraintMethod,
    required this.basicNecessities,
    required this.petActivity,
    required this.referralSource,
    required this.idImageUrl,
    required this.agreedToTerms,
    required this.adoptionStatus,
  }){
    if(remoteId == null){
      throw ArgumentError("Remote Id for Adoption request cannot be null");
    }
  }

  @override
  LocalAdoptionRequest toLocalModel() {
    return LocalAdoptionRequest()
      ..remoteId = remoteId!
      ..remoteAnimalId = animalId
      ..remoteUserId = userId
      ..firstName = firstName
      ..lastName = lastName
      ..age = age
      ..isStudent = isStudent
      ..contactNumber = contactNumber
      ..emailAddress = emailAddress
      ..facebookLink = facebookLink
      ..completeAddress = completeAddress
      ..completeCurrentAddress = completeCurrentAddress
      ..currenPetCount = currenPetCount
      ..petOwnershipDuration = petOwnershipDuration
      ..oldestLivingPetAge = oldestLivingPetAge
      ..sterilizationAwareness = sterilizationAwareness
      ..adoptedSterilizationWillingness = adoptedSterilizationWillingness
      ..regularVetClinic = regularVetClinic
      ..adoptedAccommodation = adoptedAccommodation
      ..housingType = housingType
      ..restraintMethod = restraintMethod
      ..basicNecessities = basicNecessities
      ..petActivity = petActivity
      ..referralSource = referralSource
      ..idImageUrl = idImageUrl
      ..agreedToTerms = agreedToTerms
      ..adoptionStatus = adoptionStatus;
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      '_id': remoteId,
      'animalId': animalId,
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
      'isStudent': isStudent,
      'contactNumber': contactNumber,
      'emailAddress': emailAddress,
      'facebookLink': facebookLink,
      'completeAddress': completeAddress,
      'completeCurrentAddress': completeCurrentAddress,
      'currenPetCount': currenPetCount,
      'petOwnershipDuration': petOwnershipDuration,
      'oldestLivingPetAge': oldestLivingPetAge,
      'sterilizationAwareness': sterilizationAwareness,
      'adoptedSterilizationWillingness': adoptedSterilizationWillingness,
      'regularVetClinic': regularVetClinic,
      'adoptedAccommodation': adoptedAccommodation,
      'housingType': housingType,
      'restraintMethod': restraintMethod,
      'basicNecessities': jsonEncode(basicNecessities),
      'petActivity': petActivity,
      'referralSource': referralSource,
      'idImageUrl': idImageUrl,
      'agreedToTerms': agreedToTerms,
      'adoptionStatus': adoptionStatus.name, // enum to string
    };
  }

  factory AdoptionRequestDTO.fromMap(Map<String, dynamic> map) {
    return AdoptionRequestDTO(
      remoteId: map['_id'] as String,
      animalId: map['animalId'] as String,
      userId: map['userId'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      age: map['age'] as int,
      isStudent: map['isStudent'] as bool,
      contactNumber: map['contactNumber'] as String,
      emailAddress: map['emailAddress'] as String,
      facebookLink: map['facebookLink'] as String,
      completeAddress: map['completeAddress'] as String,
      completeCurrentAddress: map['completeCurrentAddress'] as String,
      currenPetCount: map['currenPetCount'] as int,
      petOwnershipDuration: map['petOwnershipDuration'] as int,
      oldestLivingPetAge: map['oldestLivingPetAge'] as int,
      sterilizationAwareness: map['sterilizationAwareness'] as bool,
      adoptedSterilizationWillingness: map['adoptedSterilizationWillingness'] as bool,
      regularVetClinic: map['regularVetClinic'] as String?,
      adoptedAccommodation: map['adoptedAccommodation'] as String,
      housingType: map['housingType'] as String,
      restraintMethod: map['restraintMethod'] as String,
      basicNecessities: (map['basicNecessities'] is String)
          ? List<String>.from(jsonDecode(map['basicNecessities']))
          : List<String>.from(map['basicNecessities']),
      petActivity: map['petActivity'] as String,
      referralSource: map['referralSource'] as String,
      idImageUrl: map['idImageUrl'] as String,
      agreedToTerms: map['agreedToTerms'] as bool,
      adoptionStatus: AdoptionRequestStatus.values.firstWhere(
        (e) => e.name == map['adoptionStatus'],
        orElse: () => AdoptionRequestStatus.pending,
      ),
    );
  }

  factory AdoptionRequestDTO.fromLocalAdoptionRequest(LocalAdoptionRequest model) {
    return AdoptionRequestDTO(
      localId: model.id,
      remoteId: model.remoteId,
      animalId: model.remoteAnimalId,
      userId: model.remoteUserId,
      firstName: model.firstName,
      lastName: model.lastName,
      age: model.age,
      isStudent: model.isStudent,
      contactNumber: model.contactNumber,
      emailAddress: model.emailAddress,
      facebookLink: model.facebookLink,
      completeAddress: model.completeAddress,
      completeCurrentAddress: model.completeCurrentAddress,
      currenPetCount: model.currenPetCount,
      petOwnershipDuration: model.petOwnershipDuration,
      oldestLivingPetAge: model.oldestLivingPetAge,
      sterilizationAwareness: model.sterilizationAwareness,
      adoptedSterilizationWillingness: model.adoptedSterilizationWillingness,
      regularVetClinic: model.regularVetClinic,
      adoptedAccommodation: model.adoptedAccommodation,
      housingType: model.housingType,
      restraintMethod: model.restraintMethod,
      basicNecessities: model.basicNecessities,
      petActivity: model.petActivity,
      referralSource: model.referralSource,
      idImageUrl: model.idImageUrl,
      agreedToTerms: model.agreedToTerms,
      adoptionStatus: model.adoptionStatus,
    );
  }
}