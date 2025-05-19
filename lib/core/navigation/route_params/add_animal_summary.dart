import 'package:image_picker/image_picker.dart';

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
  final List<String> vaccinations;
  final List<String> medications;
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
    List<String>? vaccinations,
    List<String>? medications,
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
      'age': age,
      'location': location,
      'sex': sex,
      'species': species,
      'status': status,
      'coatColor': coatColor,
      'notes': notes,
      'traits': traits,
      'vaccinations': vaccinations,
      'medications': medications,
      'animalImagePath': animalImage?.path, // optional: just the file path
    };
  }
}
