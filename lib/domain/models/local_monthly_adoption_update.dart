import 'package:isar/isar.dart';
import 'package:mobile_app_template/core/enums/health_status.dart';
import 'package:mobile_app_template/domain/models/local_animal_medication_record.dart';
import 'package:mobile_app_template/domain/models/local_animal_vaccination_history.dart';

@collection
class LocalMonthlyAdoptionUpdate {
  Id id = Isar.autoIncrement;
  late String adoptionId;
  late String? remoteId;
  late DateTime month;
  @Enumerated(EnumType.name)
  late AnimalHealthStatus healthStatus;
  late List<String> behaviorNotes;
  late List<String> localImagePaths;
  late List<String> remoteImageUrls;
  late List<String> remarks;

  final medicationUpdates = IsarLinks<LocalAnimalMedicationRecord>();
  final vaccinationUpdates = IsarLinks<LocalAnimalVaccinationRecord>();
}