import 'package:isar/isar.dart';
import 'package:mobile_app_template/core/enums/adoption_request.dart';

// part 'adoption.g.dart';

@collection
class LocalAdoption {
  int id = Isar.autoIncrement;

  late String remoteId;
  late String animalId;
  late String adopterId;
  late String adoptionRequestId;

  late DateTime adoptionDate;

  late AdoptionRequestStatus adoptionStatus;

  List<String> notes = [];
}
