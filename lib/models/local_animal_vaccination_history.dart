import 'package:isar/isar.dart';

@collection
class LocalAnimalVaccinationRecord {
  Id id = Isar.autoIncrement;

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