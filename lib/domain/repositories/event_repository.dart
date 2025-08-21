

import 'dart:io';
import 'dart:typed_data';

import 'package:isar/isar.dart';
import 'package:mobile_app_template/network/response.dart';
import 'package:mobile_app_template/data/local_storage/isar/helpers/filter_helper.dart';
import 'package:mobile_app_template/data/local_storage/isar/model/event_model.dart';
import 'package:mobile_app_template/domain/repositories/local/file_repository.dart';

/// ### EventRepository
/// Provides implementations for local storage CRUD operations ofr [Event] objects
/// 
/// ### Parameters
/// - **[_db]**: a [Future] that resolves with [Isar] object that references the Isar database instance
/// 
/// ### Methods
/// - **[addEvent]**: method for saving [Event] objects locally
/// - **[getEvents]**: method for retrieving relevant [Event] objects

class EventRepository {
  final Isar _db;

  EventRepository(this._db);

  /// ### addEvent
  /// Creates a new instance of an [Event] locally.
  ///
  /// This method:
  /// - Saves the corresponding image file
  /// - Updates the saved event instance
  /// - Uses a locally scoped event ID
  /// - Performs a rollback by deleting the image if the operation fails
  ///
  /// ### Parameters:
  /// - **[title]** — The title of the event to be saved.
  /// - **[description]** — The description of the event.
  /// - **[date]** — The scheduled date of the event.
  /// - **[timeInMinutes]** — The time of the event (hour:minute) converted to total minutes.
  /// - **[image]** — The image data (e.g., bytes or file) to be saved locally.
  ///
  /// ### Throws:
  /// - [Exception] if there is a failure while saving the image or writing to the local database.
  ///
  /// ### Returns:
  /// - A [Future] that completes when the event is successfully saved or fails with an exception.

  Future<TResponse> addEvent(
    String title,
    String description,
    DateTime date,
    int timeInMinutes,
    Uint8List image,
  ) async{
    File? imageFile;
    try{
      final event = Event()
        ..title = title
        ..description = description
        ..date = date
        ..timeInMinutes = timeInMinutes
        ..imagePath = null; // Initialize with null, will be set later
      
      await _db.writeTxn(() async{
        final id = await _db.events.put(event);
        imageFile = await LocalFileRepository.saveFile(null, image, folders: [id.toString()], isPublic: false);
        if(imageFile == null){
          throw Exception("Failed to save file");
        }
        final savedEvent = await _db.events.get(id);
        if (savedEvent == null) {
          throw Exception("Failed to save event with ID: $id");
        }
        savedEvent.imagePath = imageFile!.path;
        await _db.events.put(savedEvent);
      });
      return TResponse(
        success: true, 
        statusCode: 200,
        message: 'Event saved to local database successfully'
      );
    }catch (e){
      //rollback the saved file if it exists
      if(imageFile != null){
        await LocalFileRepository.findAndDelete(imageFile!);
      }
      return TResponse(
        success: false, 
        statusCode: 400,
        message: 'Failed to save the event to local database: ${e.toString()}'
      ); 
    }
  }

  Future<TResponse<List<Event>>> getEvents({
    DynamicIsarFilter? filterString,
    DynamicIsarFilter? filterDate,
    EventSortBy sortBy = EventSortBy.date,
    Sort sortOrder = Sort.asc,
    int pageNum = 1,
    int itemsPerPage = 10
  }) async{
    try{
      QueryBuilder<Event, Event, QWhere> whereQuery = _db.events.where();
      QueryBuilder<Event, Event, QAfterFilterCondition> filtered = whereQuery.filter()
      .optional(
        filterString != null, 
        (q) => q.titleContains(filterString!.value)
      )
      .optional(
        filterDate != null, 
        (q){
          final strategy = filterDate!.strategy;
          switch(strategy){
            case FilterConditionType.greaterThan:
              return q.dateGreaterThan(filterDate.value);
            case FilterConditionType.lessThan:
              return q.dateLessThan(filterDate.value);
            default:
              return q.dateEqualTo(filterDate.value);
          }
        }
      );

      QueryBuilder<Event, Event, QAfterSortBy> sorted;
      if(sortBy == EventSortBy.title){
        if(sortOrder == Sort.asc){
          sorted = filtered.sortByTitle();
        }else{
          sorted = filtered.sortByTitleDesc();
        }
      }else{
        if(sortOrder == Sort.asc){
          sorted = filtered.sortByDate();
        }else{
          sorted = filtered.sortByDateDesc();
        }
      }

      final offset = pageNum * itemsPerPage;

      final result = await sorted.offset(offset).limit(itemsPerPage).findAll();

      return TResponse<List<Event>>(
        success: true, 
        statusCode: 200,
        message: "Local Event Query Success",
        data: result
      );

    }catch(e){
      return TResponse(
        success: false, 
        statusCode: 400,
        message: "Error querying events: ${e.toString()}"
      );
    }
  }

  Future<void> deleteEvent(Id id) async{
    await _db.writeTxn(() => _db.events.delete(id));
  }
}

/// Determines the field of [Event] object to be used for sorting
///```dart
///enum EventSortBy {
///title,
///date
///}
///```
enum EventSortBy {
  title,
  date
}
