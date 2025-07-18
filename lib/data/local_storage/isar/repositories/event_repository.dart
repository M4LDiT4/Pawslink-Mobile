

import 'dart:io';
import 'dart:typed_data';

import 'package:isar/isar.dart';
import 'package:mobile_app_template/data/local_storage/isar/helpers/isar_filter_helper.dart';
import 'package:mobile_app_template/data/local_storage/isar/helpers/isar_helper.dart';
import 'package:mobile_app_template/data/local_storage/isar/model/event_model.dart';
import 'package:mobile_app_template/data/repositories/file_repository.dart';

enum SortOrder {asc, desc}

class EventRepository {
  final Future<Isar> _db;

  EventRepository(this._db);

  ///creates a new instance of event locally
  ///saves corresponding image file and updates the saved event instance
  ///event id is local only
  ///rollbacks/deletes the saved image if operation fails
  ///@param title is the title of the event to be saved
  ///
  ///@param description is the description of the event to be saved
  ///
  ///@param date is the date of the event
  ///
  ///@param timeInMinutes is the time of the event (hour: minute) converted to minutes
  ///
  ///@param image is the image datat to be saved locally
  ///
  ///@throws Exception when there is failure to save a file or write in local database
  ///
  ///@returns Future that resolves when the event fails/successfully saved in local database
  Future<void> addEvent(
    String title,
    String description,
    DateTime date,
    int timeInMinutes,
    Uint8List image,
  ) async{
    File? imageFile;
    try{
      final isar = await _db;
      final event = Event()
        ..title = title
        ..description = description
        ..date = date
        ..timeInMinutes = timeInMinutes
        ..imagePath = null; // Initialize with null, will be set later
      
      await isar.writeTxn(() async{
        final id = await isar.events.put(event);
        imageFile = await LocalFileRepository.saveFile(null, image, folders: [id.toString()]);
        if(imageFile == null){
          throw Exception("Failed to save file");
        }
        final savedEvent = await isar.events.get(id);
        if (savedEvent == null) {
          throw Exception("Failed to save event with ID: $id");
        }
        savedEvent.imagePath = imageFile!.path;
        await isar.events.put(savedEvent);
      });
    }catch (e){
      //rollback the saved file if it exists
      if(imageFile != null){
        await LocalFileRepository.findAndDelete(imageFile!);
      }
      rethrow; 
    }
  }

  Future<List<Event>> getAllEvents() async {
    final isar = await _db;
    return await isar.events.where().findAll();
  }


  Future<List<Event>> getEvents(
    DynamicFilter<String>? titleFilter,
    DynamicFilter<DateTime>? dateFilter,
    String? sortBy, //property to sort
    Sort? sortOrder, 
  ) async {
    final isar = await _db;
    return buildDynamicQuery<Event>(
      collection: isar.events,
      filterGroup: FilterGroup.and([
        if(titleFilter != null) IsarFilterHelper.buildStringFilterCondition(titleFilter, false),
        if(dateFilter != null) IsarFilterHelper.buildNumFilterCondition(dateFilter)
      ])
    );
  }

  Future<void> deleteEvent(Id id) async{
    final isar = await _db;
    await isar.writeTxn(() => isar.events.delete(id));
  }
}
