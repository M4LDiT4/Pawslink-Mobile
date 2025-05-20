import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/text_strings.dart';

enum AnimalStatus { transient, rainbowBridge, adopted, onCampus, owned }

extension AnimalStatusExtension on AnimalStatus {
  String get label {
    switch (this) {
      case AnimalStatus.transient:
        return TText.transient;
      case AnimalStatus.adopted:
        return TText.adopted;
      case AnimalStatus.onCampus:
        return TText.onCampus;
      case AnimalStatus.owned:
        return TText.owned;
      case AnimalStatus.rainbowBridge:
        return TText.rainbowBridge;
    }
  }
}

extension AnimalStatusColorExtension on AnimalStatus {
  Color get color {
    switch (this) {
      case AnimalStatus.transient:
        return Colors.orange;
      case AnimalStatus.adopted:
        return Colors.green;
      case AnimalStatus.onCampus:
        return Colors.blue;
      case AnimalStatus.owned:
        return Colors.purple;
      case AnimalStatus.rainbowBridge:
        return Colors.grey;
    }
  }
}

extension AnimalStatusTextColorExtension on AnimalStatus {
  Color get titleTextColor {
    return color.computeLuminance() > 0.5 ? Colors.black : Colors.white;
  }
}

