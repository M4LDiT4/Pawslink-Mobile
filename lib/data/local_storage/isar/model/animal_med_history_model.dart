
import 'package:isar/isar.dart';

part 'animal_med_history_model.g.dart';
@collection
class AnimalMedication {
  Id id = Isar.autoIncrement;

  late String medFor;
  late DateTime medDate;
}