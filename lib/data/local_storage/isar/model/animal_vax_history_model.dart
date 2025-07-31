import 'package:isar/isar.dart';

part 'animal_vax_history_model.g.dart';

@collection
class AnimalVaccination {
  Id id = Isar.autoIncrement;

  late String vaxFor;
  late DateTime vaxDate;

}