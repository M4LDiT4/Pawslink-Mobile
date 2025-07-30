
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_app_template/core/navigation/route_params/route_param_base_class.dart';
import 'package:mobile_app_template/core/utils/helpers/number_helpers.dart';

class AddEventParams extends RouteParamBaseClass {
  final String title;
  final DateTime date;
  final TimeOfDay time;
  final String description;
  final XFile? eventImage;

  AddEventParams({
    required this.title,
    required this.date,
    required this.time,
    required this.description,
    this.eventImage
  });

  @override
  Map<String, dynamic> toMap(){
    return{
      'title': title,
      'date' : date.toUtc(),
      'time' : TNumberHelper.timeOfDayToMinutes(time),
      'description': description
    };
  }

  XFile? getEventImage(){
    return eventImage;
  }
}