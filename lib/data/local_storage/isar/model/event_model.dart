
import 'package:isar/isar.dart';

part 'event_model.g.dart';

@collection
class Event {
  Id id = Isar.autoIncrement; //local identifier 

  @Index(caseSensitive: false)
  late String title;

  late String description;

  @Index(name: 'date_title', composite: [CompositeIndex('title')])
  late DateTime date;

  late int timeInMinutes;
  
  late String? imagePath;
}

enum IEventIndexNames {
  dateTitle,
  title
}

