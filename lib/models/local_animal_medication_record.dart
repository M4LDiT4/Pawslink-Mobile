
import 'package:isar/isar.dart';

@collection
class LocalAnimalMedicationRecord {
  Id id = Isar.autoIncrement;

  late String medicationName;
  late String dosage;
  late String route;
  late DateTime dateGiven;
  late int durationInDays;
  late String reason;
  late String prescribedBy;
  late List<String> notes;
}