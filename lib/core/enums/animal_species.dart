import 'package:mobile_app_template/core/constants/text_strings.dart';

enum AnimalSpecies {dog, cat, unknown}

extension AnimalSpeciesExtension on AnimalSpecies{
  String get label{
    switch(this){
      case AnimalSpecies.dog:
        return TText.dog;
      case AnimalSpecies.cat:
        return TText.cat;
      default:
        return 'unknown';
    }
  }
}