import 'package:flutter/material.dart';

class TNumberHelper {
  TNumberHelper._();
  
  static int getAlphaWithOpacity(double opacity){
    return (255 * opacity).toInt();
  }

  static int timeOfDayToMinutes(TimeOfDay timeOfDay){
    return timeOfDay.hour * 60 + timeOfDay.minute;
  }

  static TimeOfDay minutesToTimeOfDay(int minutes){
    final int hour = minutes~/60;
    final int minute = minutes % 60;

    return TimeOfDay(hour: hour, minute: minute);
  }
}