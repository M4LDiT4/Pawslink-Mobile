

import 'dart:io';
import 'dart:typed_data';

import 'package:isar/isar.dart';
import 'package:mobile_app_template/data/local_storage/isar/helpers/isar_filter_helper.dart';
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

  ///@method getEvents
  ///@description -generates returns @Event model documents from the local database
  ///@param title -look for documents with @title property contains this string
  ///@param date -sorts docume
  Future<List<Event>> getEvents(
    DynamicIsarFilter<String>? titleFilter,
    DynamicIsarFilter<DateTime>? dateFilter,
    {
      Sort sortOrder = Sort.asc,
      EventSortBy sortBy = EventSortBy.title,
      int offset = 0,
      int limit = 10
    }
  ) async{
    final isar = await _db;

    final query = isar.events.where()
    .filter()
    .optional(
      titleFilter != null && titleFilter.isStrategyValid(), 
      (q){
        final strategy = titleFilter!.strategy;
        switch(strategy){
          case FilterConditionType.startsWith:
            return q.titleStartsWith(titleFilter.value);
          case FilterConditionType.endsWith:
            return q.titleEndsWith(titleFilter.value);
          default:
            return q.titleContains(titleFilter.value);
        }
      }
    )
    .optional(
      dateFilter != null && dateFilter.isStrategyValid(), 
      (q){
        final strategy = dateFilter!.strategy;
        switch(strategy){
          case FilterConditionType.greaterThan:
            return q.dateGreaterThan(dateFilter.value, include: dateFilter.include1);
          case FilterConditionType.lessThan:
            return q.dateGreaterThan(dateFilter.value, include: dateFilter.include1);
          default:
            return q.dateEqualTo(dateFilter.value);
        }
      }
    );

    QueryBuilder<Event, Event, QAfterSortBy> sorted;
    if(sortBy == EventSortBy.date){
      if(sortOrder == Sort.desc){
        sorted = query.sortByDateDesc();
      }else{
        sorted = query.sortByDate();
      }
    }else{
      if(sortOrder == Sort.desc){
        sorted = query.sortByTitleDesc();
      }else{
        sorted = query.sortByTitle();
      }
    }
    return sorted
      .offset(offset)
      .limit(limit)
      .findAll();
  }

  Future<void> deleteEvent(Id id) async{
    final isar = await _db;
    await isar.writeTxn(() => isar.events.delete(id));
  }
}

//determines what property will be used for sorting
enum EventSortBy {
  title,
  date
}
