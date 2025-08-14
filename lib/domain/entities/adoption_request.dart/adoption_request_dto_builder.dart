import 'package:mobile_app_template/domain/entities/adoption_request.dart/adoption_request_dto.dart';
import 'package:mobile_app_template/core/enums/adoption_request.dart';

class AdoptionRequestBuilder {
  int? localId;
  String remoteId = ''; // default empty, should be assigned later

  String? animalId;
  String? userId;
  String? firstName;
  String? lastName;
  int? age;
  bool? isStudent;
  String? contactNumber;
  String? emailAddress;
  String? facebookLink;
  String? completeAddress;
  String? completeCurrentAddress;
  int? currenPetCount;
  int? petOwnershipDuration;
  int? oldestLivingPetAge;
  bool? sterilizationAwareness;
  bool? adoptedSterilizationWillingness;
  String? regularVetClinic;
  String? adoptedAccommodation;
  String? housingType;
  String? restraintMethod;
  List<String> basicNecessities = [];
  String? petActivity;
  String? referralSource;
  String? idImageUrl;
  bool? agreedToTerms;
  AdoptionRequestStatus? adoptionStatus;

  AdoptionRequestDTO build() {
    if (remoteId.isEmpty ||
        firstName == null ||
        lastName == null ||
        age == null ||
        isStudent == null ||
        contactNumber == null ||
        emailAddress == null ||
        facebookLink == null ||
        completeAddress == null ||
        completeCurrentAddress == null ||
        currenPetCount == null ||
        petOwnershipDuration == null ||
        oldestLivingPetAge == null ||
        sterilizationAwareness == null ||
        adoptedSterilizationWillingness == null ||
        adoptedAccommodation == null ||
        housingType == null ||
        restraintMethod == null ||
        petActivity == null ||
        referralSource == null ||
        idImageUrl == null ||
        agreedToTerms == null ||
        adoptionStatus == null) {
      throw StateError('Required fields are missing');
    }

    return AdoptionRequestDTO(
      localId: localId,
      remoteId: remoteId,
      animalId: animalId!,
      userId: userId!,
      firstName: firstName!,
      lastName: lastName!,
      age: age!,
      isStudent: isStudent!,
      contactNumber: contactNumber!,
      emailAddress: emailAddress!,
      facebookLink: facebookLink!,
      completeAddress: completeAddress!,
      completeCurrentAddress: completeCurrentAddress!,
      currenPetCount: currenPetCount!,
      petOwnershipDuration: petOwnershipDuration!,
      oldestLivingPetAge: oldestLivingPetAge!,
      sterilizationAwareness: sterilizationAwareness!,
      adoptedSterilizationWillingness: adoptedSterilizationWillingness!,
      regularVetClinic: regularVetClinic,
      adoptedAccommodation: adoptedAccommodation!,
      housingType: housingType!,
      restraintMethod: restraintMethod!,
      basicNecessities: basicNecessities,
      petActivity: petActivity!,
      referralSource: referralSource!,
      idImageUrl: idImageUrl!,
      agreedToTerms: agreedToTerms!,
      adoptionStatus: adoptionStatus!,
    );
  }
}
