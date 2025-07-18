
import 'package:isar/isar.dart';

part 'event_model.g.dart';

@collection
class Event {
  Id id = Isar.autoIncrement; //local identifier 

  @Index(composite: [CompositeIndex('date')])
  late String title;

  late String description;

  late DateTime date;

  late int timeInMinutes;
  
  late String? imagePath;
}