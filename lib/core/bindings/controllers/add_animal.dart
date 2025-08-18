
import 'package:get/get.dart';
import 'package:mobile_app_template/features/animal_database/controllers/add_animal_controller.dart';

class AddAnimalControllerBinding extends Bindings {
  @override
  void dependencies () {
    Get.lazyPut<AddAnimalController>(() => AddAnimalController(prevAnimal: Get.arguments));
  }
}