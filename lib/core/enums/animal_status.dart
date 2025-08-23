import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/text_strings.dart';

enum AnimalStatus { transient, rainbowBridge, adopted, onCampus, owned, unknown }

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
      default:
        return TText.unknown;
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
      default:
        return const Color(0xFFE0E0E0);
    }
  }
}

extension AnimalStatusTextColorExtension on AnimalStatus {
  Color get titleTextColor {
    return color.computeLuminance() > 0.5 ? Colors.black : Colors.white;
  }
}

AnimalStatus animalStatusFromString(String string) {
  try {
    return AnimalStatus.values.firstWhere(
      (status) => status.name.toLowerCase() == string.toLowerCase(),
      orElse: () => AnimalStatus.unknown,
    );
  } catch (_) {
    return AnimalStatus.unknown;
  }
}
