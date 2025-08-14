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

AnimalSpecies animalSpeciesFromString(String string) {
  final lower = string.trim().toLowerCase();

  if (lower == TText.dog.toLowerCase()) {
    return AnimalSpecies.dog;
  } else if (lower == TText.cat.toLowerCase()) {
    return AnimalSpecies.cat;
  } else if (lower == TText.unknown.toLowerCase()) {
    return AnimalSpecies.unknown;
  } else {
    throw UnsupportedError(
      "Expects one of: [${TText.dog}, ${TText.cat}, ${TText.unknown}] but got: '$string'"
    );
  }
}
