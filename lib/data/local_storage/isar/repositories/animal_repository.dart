
import 'package:isar/isar.dart';
import 'package:mobile_app_template/data/local_storage/isar/database/isar_service.dart';
import 'package:mobile_app_template/data/local_storage/isar/model/animal_model.dart';

class AnimalRepository {
  final Future<Isar> _db = IsarService().isar;

  Future<void> addAnimal(Animal animal) async {
    final isar = await _db;
    await isar.writeTxn(() async => await isar.animals.put(animal));
  }

  Future<List<Animal>> getAllAnimals() async {
    final isar = await _db;
    return await isar.animals.where().findAll();
  }

  Future<void> deleteAnimal(Id id) async {
    final isar = await _db;
    await isar.writeTxn(() => isar.animals.delete(id));
  }
}