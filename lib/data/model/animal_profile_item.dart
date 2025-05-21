import 'package:mobile_app_template/core/enums/animal_sex.dart';
import 'package:mobile_app_template/core/enums/animal_status.dart';

class AnimalProfile {
  final String animalPofileLink;
  final String name;
  final String location;
  final AnimalSex sex;
  final AnimalStatus status;
  final String id;

  AnimalProfile({
    required this.animalPofileLink,
    required this.name,
    required this.location,
    required this.sex,
    required this.id,
    required this.status
  });
}