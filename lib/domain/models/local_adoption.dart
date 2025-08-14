import 'package:isar/isar.dart';
import 'package:mobile_app_template/core/enums/adoption_request.dart';

part 'local_adoption.g.dart';

@collection
class LocalAdoption {
  Id id = Isar.autoIncrement;

  late String remoteId;
  late String animalId;
  late String adopterId;
  late String adoptionRequestId;

  late DateTime adoptionDate;

  @Enumerated(EnumType.name)
  late AdoptionRequestStatus adoptionStatus;

  List<String> notes = [];
}
