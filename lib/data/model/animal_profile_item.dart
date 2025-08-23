import 'package:mobile_app_template/core/constants/image_strings.dart';
import 'package:mobile_app_template/core/enums/animal_sex.dart';
import 'package:mobile_app_template/core/enums/animal_species.dart';
import 'package:mobile_app_template/core/enums/animal_status.dart';

class AnimalProfile {
  final String? animalProfileLink;
  final String name;
  final String location;
  final AnimalSex sex;
  final AnimalStatus status;
  final AnimalSpecies species;
  final String id;

  AnimalProfile({
    this.animalProfileLink,
    required this.name,
    required this.location,
    required this.sex,
    required this.id,
    required this.status,
    required this.species
  });

  String getFallBackImage(){
    switch(species){
      case AnimalSpecies.cat:
        return TImages.catIcon;
      case AnimalSpecies.dog:
        return TImages.dogIcon;
      default:
        return TImages.unknown;
    }
  }
}