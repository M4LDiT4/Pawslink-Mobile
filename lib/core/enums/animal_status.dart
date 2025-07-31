import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/text_strings.dart';

enum AnimalStatus { transient, rainbow_bridge, adopted, on_campus, owned }

extension AnimalStatusExtension on AnimalStatus {
  String get label {
    switch (this) {
      case AnimalStatus.transient:
        return TText.transient;
      case AnimalStatus.adopted:
        return TText.adopted;
      case AnimalStatus.on_campus:
        return TText.onCampus;
      case AnimalStatus.owned:
        return TText.owned;
      case AnimalStatus.rainbow_bridge:
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
      case AnimalStatus.on_campus:
        return Colors.blue;
      case AnimalStatus.owned:
        return Colors.purple;
      case AnimalStatus.rainbow_bridge:
        return Colors.grey;
    }
  }
}

extension AnimalStatusTextColorExtension on AnimalStatus {
  Color get titleTextColor {
    return color.computeLuminance() > 0.5 ? Colors.black : Colors.white;
  }
}

