import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/text_strings.dart';
import 'package:mobile_app_template/core/utils/device/device_utility.dart';

enum AnimalSex {male, female, unknown}

extension AnimalSexExtension on AnimalSex {
  String get label{
    switch(this){
      case AnimalSex.male:
        return TText.male;
      case AnimalSex.female:
        return TText.female;
      default:
        return 'unknown';
    }

  }
}

extension AnimalSexColorExtension on AnimalSex {
  Color get color {
    final isDarkMode = TDeviceUtils.isDarkMode();
    switch (this) {
      case AnimalSex.male:
        return isDarkMode ? Colors.lightBlueAccent : Colors.blueAccent;
      case AnimalSex.female:
        return isDarkMode ? Colors.pink.shade200 : Colors.pinkAccent;
      default:
        return Colors.grey;
    }
  }
}


extension AnimalSexWidgetExtension on AnimalSex {
  IconData get icon {
    switch(this){
      case AnimalSex.female:
        return Icons.female;
      case AnimalSex.male:
        return Icons.male;
      default:
        return Icons.question_mark;
    }
  }
}