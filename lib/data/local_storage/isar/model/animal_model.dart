
import 'package:isar/isar.dart';

part 'animal_model.g.dart';

@collection
class Animal{
  Id id = Isar.autoIncrement;

  late String name;
  late int age;
  late bool isSterilized;
}