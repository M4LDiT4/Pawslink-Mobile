
enum AnimalStatus {transient, rainbowBridge, adopted, onCampus, owned}

extension AnimalStatusExtension on AnimalStatus {
  String get label {
    switch(this){
      case AnimalStatus.transient:
        return "Transient";
      case AnimalStatus.adopted:
        return "Adopted";
      case AnimalStatus.onCampus:
        return "On Campus";
      case AnimalStatus.owned:
        return "Owned";
      case AnimalStatus.rainbowBridge:
        return "Rainbow Bridge";
    }
  }
}