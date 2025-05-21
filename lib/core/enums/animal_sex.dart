import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/text_strings.dart';

enum AnimalSex {male, female}

extension AnimalSexExtension on AnimalSex {
  String get label{
    switch(this){
      case AnimalSex.male:
        return TText.male;
      case AnimalSex.female:
        return TText.female;
    }

  }
}

extension AnimalSexColorExtension on AnimalSex {
  Color get color {
    switch (this) {
      case AnimalSex.male:
        return Colors.blueAccent;
      case AnimalSex.female:
        return Colors.pinkAccent;
    }
  }
}