import 'package:bson/bson.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_app_template/core/enums/animal_sex.dart';
import 'package:mobile_app_template/core/enums/animal_species.dart';
import 'package:mobile_app_template/core/enums/animal_status.dart';
import 'package:mobile_app_template/core/extensions/string_extensions.dart';
import 'package:mobile_app_template/core/navigation/route_params/route_param_base_class.dart';
import 'package:mobile_app_template/data/local_storage/isar/model/animal_model.dart';
import 'package:mobile_app_template/data/model/modal_input_list_item.dart';

class AddAnimalSummaryParams extends RouteParamBaseClass{
  final String name;
  final String age;
  final String location;
  final String sex;
  final String species;
  final String status;
  DateTime? sterilizationDate;
  final List<String> coatColor;
  final List<String> notes;
  final List<String> traits;
  final List<ModalInputListItem> vaccinations;
  final List<ModalInputListItem> medications;
  final XFile? animalImage;

  AddAnimalSummaryParams({
    required this.name,
    required this.age,
    required this.location,
    required this.sex,
    required this.species,
    required this.status,
    this.sterilizationDate,
    List<String>? coatColor,
    List<String>? notes,
    List<String>? traits,
    List<ModalInputListItem>? vaccinations,
    List<ModalInputListItem>? medications,
    this.animalImage,
  })  : coatColor = coatColor ?? [],
        notes = notes ?? [],
        traits = traits ?? [],
        vaccinations = vaccinations ?? [],
        medications = medications ?? [];
  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'species': species.toLowerCase(),
      'age': age,
      'location': location,
      'sex': sex.toLowerCase(),
      'status': status.toLowerCase(),
      'coatColor': coatColor,
      'notes': notes,
      'traitsAndPersonality': traits,
      'vaxHistory': vaccinations.map((item)=> item.getDataInMap()).toList(),
      'medHistory': medications.map((item)=> item.getDataInMap()).toList(),
      // add sterilization date
    };
  }

  Animal toAnimal () {
    Animal animal =  Animal()
    ..bsonId = ObjectId().toString()
    ..name = name
    ..age = int.parse(age)
    ..location = location
    ..sex = sex.enumFromString<AnimalSex>(AnimalSex.values)
    ..species = species.enumFromString<AnimalSpecies>(AnimalSpecies.values)
    ..status = status.enumFromString<AnimalStatus>(AnimalStatus.values)
    ..coatColor = coatColor
    ..notes = notes
    ..traitsAndPersonality = traits
    ..createdAt = DateTime.now()
    ..updatedAt = DateTime.now()
    ..sterilizationDate = sterilizationDate;

    return animal;
  }

  XFile? getImage(){
    return animalImage;
  }
}
