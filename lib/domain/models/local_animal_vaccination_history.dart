import 'package:isar/isar.dart';
import 'package:mobile_app_template/domain/models/time_stamp.dart';

part 'local_animal_vaccination_history.g.dart';

@collection
class LocalAnimalVaccinationRecord with Timestamped {
  Id id = Isar.autoIncrement;

  late String? remoteAnimalId; //if null then animal associated with this is saved locally. Can be used to reference cloud copy of animal
  late String vaccineName;
  late DateTime dateGiven;
  late int doseNumber;
  late DateTime? nextDuedate;
  late String administeredBy;
  late int batchNumber;
  late DateTime expiryDate;
  late String route;
  late List<String> notes;
}