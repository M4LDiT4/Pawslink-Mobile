

import 'package:isar/isar.dart';
import 'package:mobile_app_template/data/local_storage/isar/model/event_model.dart';

class EventRepository {
  final Future<Isar> _db;

  EventRepository(this._db);

  Future<void> addEvent(Event event) async{
  final isar = await _db;
  await isar.writeTxn(() async => await isar.events.put(event));
  }

  Future<List<Event>> getAllEvents() async {
    final isar = await _db;
    return await isar.events.where().findAll();
  }

  Future<void> deleteEvent(Id id) async{
    final isar = await _db;
    await isar.writeTxn(() => isar.events.delete(id));
  }
}