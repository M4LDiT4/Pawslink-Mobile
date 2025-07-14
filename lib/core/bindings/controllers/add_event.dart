import 'package:get/get.dart';
import 'package:mobile_app_template/features/events/controllers/add_event_controller.dart';

class AddEventControllerBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<Addeventcontroller>(() => Addeventcontroller());
  }
}