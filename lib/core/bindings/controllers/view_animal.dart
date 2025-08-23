import 'package:get/get.dart';
import 'package:mobile_app_template/features/animal_database/controllers/view_animal_details_controller.dart';

class ViewAnimalDetailsControllerBinding extends Bindings{
  @override
  void dependencies (){
    Get.lazyPut<ViewAnimalDetailsController>(() => ViewAnimalDetailsController(Get.arguments));
  }
}