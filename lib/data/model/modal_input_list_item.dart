import 'package:mobile_app_template/data/local_storage/isar/model/animal_med_history_model.dart';
import 'package:mobile_app_template/data/local_storage/isar/model/animal_vax_history_model.dart';

class ModalInputListItem {
  final String title;
  final String subtitle;
  //actual data for the item that is in json format
  //this will be used to interface different modal strategies
  final Map<String, dynamic> data;

  ModalInputListItem({
    required this.title,
    required this.subtitle,
    required this.data
  });


  String getTitle(){
    return title;
  }

  String getSubTitle(){
    return subtitle;
  }

  String getValueInString(){
    return '$title, $subtitle';
  }

  Map<String, dynamic> getDataInMap(){
    return data;
  }
}

extension ModalInputToAnimalVax on ModalInputListItem {
  AnimalVaccination modalInputToAnimalVaxModel(){
    DateTime date = data['date'];
    String description = data['description'];
    return AnimalVaccination()
      ..vaxDate = date
      ..vaxFor = description;
  }
}

extension ModalInputToAnimalMed on ModalInputListItem{
  AnimalMedication modalInputToAnimalMedModel(){
    DateTime date = data['date'];
    String description = data['description'];
    return AnimalMedication()
      ..medDate = date
      ..medFor = description;
    
  }
}