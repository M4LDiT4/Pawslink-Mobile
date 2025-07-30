import 'package:image_picker/image_picker.dart';
import 'package:mobile_app_template/core/navigation/route_params/route_param_base_class.dart';
import 'package:mobile_app_template/data/model/modal_input_list_item.dart';

class AddAnimalSummaryParams extends RouteParamBaseClass{
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
    };
  }

  XFile? getImage(){
    return animalImage;
  }
}
