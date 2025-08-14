import 'package:flutter/material.dart';
import 'package:mobile_app_template/domain/entities/base_dto.dart';
import 'package:mobile_app_template/core/utils/helpers/number_helpers.dart';
import 'package:mobile_app_template/domain/models/local_event.dart';

class EventDTO extends BaseDto<LocalEvent> {
  String eventName;
  DateTime eventDate;
  TimeOfDay eventTime;
  String location;
  String description;

  EventDTO({
    super.localId,
    super.remoteId,
    required this.eventName,
    required this.eventDate,
    required this.eventTime,
    required this.location,
    required this.description
  });

  @override
  LocalEvent toLocalModel(){
    return LocalEvent()
      ..eventName = eventName
      ..eventDate = eventDate
      ..eventTime = eventTime
      ..location = location
      ..description = description;
  }

  @override
  Map<String, String> toMap() {
    final Map<String, String> event = {
      'eventName': eventName,
      'eventDate': eventDate.toIso8601String(),
      'eventTime': TNumberHelper.timeOfDayToMinutes(eventTime).toString(), // or store as Map if needed
      'location': location,
      'description': description,
    };
    if(remoteId != null){
      event['_id'] = remoteId!;
    }

    return event;
  }

  factory EventDTO.fromMap(Map<String, dynamic> map) {
    return EventDTO(
      remoteId: map['_id'] as String,
      eventName: map['eventName'] as String,
      eventDate: DateTime.parse(map['eventDate']),
      eventTime: TNumberHelper.minutesToTimeOfDay(map['eventTime']),
      location: map['location'] as String,
      description: map['description'] as String,
    );
  }

  factory EventDTO.fromLocalEvent(LocalEvent localEvent) {
    return EventDTO(
      localId: localEvent.id,
      remoteId: localEvent.remoteId,
      eventName: localEvent.eventName,
      eventDate: localEvent.eventDate,
      eventTime: localEvent.eventTime,
      location: localEvent.location,
      description: localEvent.description,
    );
  }

}