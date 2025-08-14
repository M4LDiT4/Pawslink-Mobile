import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/text_strings.dart';

enum AnimalStatus { transient, rainbow_bridge, adopted, on_campus, owned, unknown }

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
      case AnimalStatus.on_campus:
        return Colors.blue;
      case AnimalStatus.owned:
        return Colors.purple;
      case AnimalStatus.rainbow_bridge:
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
  final lower = string.toLowerCase();

  if (lower == TText.transient.toLowerCase()) {
    return AnimalStatus.transient;
  } else if (lower == TText.adopted.toLowerCase()) {
    return AnimalStatus.adopted;
  } else if (lower == TText.onCampus.toLowerCase()) {
    return AnimalStatus.on_campus;
  } else if (lower == TText.owned.toLowerCase()) {
    return AnimalStatus.owned;
  } else if (lower == TText.rainbowBridge.toLowerCase()) {
    return AnimalStatus.rainbow_bridge;
  } else if (lower == TText.unknown.toLowerCase()) {
    return AnimalStatus.unknown;
  } else {
    throw UnsupportedError(
      "Expects: [${TText.transient}, ${TText.adopted}, ${TText.onCampus}, ${TText.owned}, ${TText.rainbowBridge}, ${TText.unknown}] given: $string"
    );
  }
}