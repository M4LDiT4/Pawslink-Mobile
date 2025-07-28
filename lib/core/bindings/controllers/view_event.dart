
import 'package:get/get.dart';
import 'package:mobile_app_template/features/events/controllers/view_event_controller.dart';

class ViewEventControllerAdminBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<ViewEventController>(() => ViewEventController());
  }
}