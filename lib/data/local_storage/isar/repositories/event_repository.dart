

import 'dart:io';
import 'dart:typed_data';

import 'package:isar/isar.dart';
import 'package:mobile_app_template/data/local_storage/isar/helpers/isar_filter_helper.dart';
import 'package:mobile_app_template/data/local_storage/isar/helpers/isar_query_helper.dart';
import 'package:mobile_app_template/data/local_storage/isar/model/event_model.dart';
import 'package:mobile_app_template/data/repositories/file_repository.dart';

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
  final Future<Isar> _db;

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

  /// ### getEvents
  ///
  /// Generates and returns a list of [Event] object from the local database
  /// 
  /// This method:
  /// - filters documents based on the given filters
  /// - sorts the documents
  /// - applies pagination
  /// 
  ///  ### Parameters
  /// 
  /// - **[titleFilter]**: [DynamicIsarFilter] object that stores value and strategy for filtering the `title` property of [Event] object
  /// - **[dateFilter]**: [DynamicIsarFilter] object that stores value and strategy for filtering the `date` property of [Event] object.
  /// - **[sortOrder]**: [Sort] object that determines the sorting order of the returned documents
  /// - **[sortBy]**: [EventSortBy] object that determines what property of [Event] object will be used for sorting.
  /// Allowced values are: `EventSortBy.title` and `EventSortBy.date`
  /// - **[offset]**: determines the number of skipped [Event] document. Defaults to `0`
  /// - **[limit]**: determines maximum number of [Event] document that can be returned per request. Defaults to `10` 
  /// 
  /// ### Returns
  /// A [Future] that resolves to a [List] of [Event] objects.
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
    final event = IsarQueryHelper.buildQuery(
      collection: isar.events,
      filters: [
        if(titleFilter != null) titleFilter.generateFilterCondition(),
        if(dateFilter != null) dateFilter.generateFilterCondition()
      ]
    );

    return event.findAll();

  }

  Future<void> deleteEvent(Id id) async{
    final isar = await _db;
    await isar.writeTxn(() => isar.events.delete(id));
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
