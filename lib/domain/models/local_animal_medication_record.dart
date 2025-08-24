
import 'package:isar/isar.dart';
import 'package:mobile_app_template/domain/models/time_stamp.dart';

part 'local_animal_medication_record.g.dart';

@collection
class LocalAnimalMedicationRecord with Timestamped{
  Id id = Isar.autoIncrement;

  late String? remoteAnimalId; //if null, the animal is saved locally, otherwise there is a cloud copy of the animal. Can be used to reference the cloud copy of animal
  late String medicationName;
  late String dosage;
  late String route;
  late DateTime dateGiven;
  late int durationInDays;
  late String reason;
  late String prescribedBy;
  late List<String> notes;
}