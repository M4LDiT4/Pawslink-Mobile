import 'package:image_picker/image_picker.dart';
import 'package:mobile_app_template/data/model/modal_input_list_item.dart';

class AddAnimalSummaryParams {
  final String? userId;
  final String name;
  final String age;
  final String location;
  final String sex;
  final String species;
  final String status;
  final List<String> coatColor;
  final List<String> notes;
  final List<String> traits;
  final List<ModalInputListItem> vaccinations;
  final List<ModalInputListItem> medications;
  final XFile? animalImage;

  AddAnimalSummaryParams({
    this.userId,
    required this.name,
    required this.age,
    required this.location,
    required this.sex,
    required this.species,
    required this.status,
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

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'speceis': species,
      'age': age,
      'location': location,
      'sex': sex,
      'status': status,
      'coatColor': coatColor,
      'notes': notes,
      'traitsAndPersonality': traits,
      'vaxHistory': vaccinations.map((item)=> item.getDataInMap()).toList(),
      'medHistory': medications.map((item)=> item.getDataInMap()).toList(),
    };
  }

  XFile? getImage(){
    return animalImage;
  }
}
