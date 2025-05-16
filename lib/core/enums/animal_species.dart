enum AnimalSpecies {dog, cat}

extension AnimalSpeciesExtension on AnimalSpecies{
  String get label{
    switch(this){
      case AnimalSpecies.dog:
        return "Dog";
      case AnimalSpecies.cat:
        return "cat";
    }
  }
}