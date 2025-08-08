// part 'event.g.dart';

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:mobile_app_template/core/utils/helpers/number_helpers.dart';

@collection
class LocalEvent {
  Id id = Isar.autoIncrement; // Isar's local ID

  late String remoteId; // Not nullable; use DTO to ensure it's non-null
  late String eventName;
  late DateTime eventDate;
  late int _eventTimeInMinutes;
  late String location;
  late String description;

  TimeOfDay get eventTime => TNumberHelper.minutesToTimeOfDay(_eventTimeInMinutes);

  set eventTime(TimeOfDay time){
    _eventTimeInMinutes = TNumberHelper.timeOfDayToMinutes(time);
  }

}