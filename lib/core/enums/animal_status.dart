
import 'package:mobile_app_template/core/constants/text_strings.dart';

enum AnimalStatus {transient, rainbowBridge, adopted, onCampus, owned}

extension AnimalStatusExtension on AnimalStatus {
  String get label {
    switch(this){
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