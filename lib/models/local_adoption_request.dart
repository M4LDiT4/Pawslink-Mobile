import 'package:isar/isar.dart';
import 'package:mobile_app_template/core/enums/adoption_request.dart';

// part 'adoption_request.g.dart'; // Run `flutter pub run build_runner build`

@collection
class LocalAdoptionRequest {
  Id id = Isar.autoIncrement; // localId

  late String remoteId; //reference to the cloud instance of this adoption request

  late String remoteAnimalId;
  late String remoteUserId;

  late String firstName;
  late String lastName;
  late int age;
  late bool isStudent;
  late String contactNumber;
  late String emailAddress;
  late String facebookLink;
  late String completeAddress;
  late String completeCurrentAddress;

  late int currenPetCount;
  late int petOwnershipDuration;
  late int oldestLivingPetAge;

  late bool sterilizationAwareness;
  late bool adoptedSterilizationWillingness;

  String? regularVetClinic;

  late String adoptedAccommodation;
  late String housingType;
  late String restraintMethod;

  late List<String> basicNecessities;

  late String petActivity;
  late String referralSource;
  late String idImageUrl;

  late bool agreedToTerms;

  @Enumerated(EnumType.ordinal)
  late AdoptionRequestStatus adoptionStatus;

  @Index()
  String get statusIndex => adoptionStatus.name; // optional string index
}
