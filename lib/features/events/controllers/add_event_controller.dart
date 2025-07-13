
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile_app_template/core/widgets/pickers/date_pickers/generic_datepicker_controller.dart';
import 'package:mobile_app_template/core/widgets/pickers/time_pickers/generic_time_picker_controller.dart';

class Addeventcontroller extends GetxController{
  late GlobalKey<FormState> key = GlobalKey<FormState>();
  
  late TextEditingController titleController;
  late TextEditingController locationController;
  late GenericDatepickerController dateController;
  late GenericTimePickerController timeController;
  late TextEditingController descriptionController;

  @override
  void onInit() {
    super.onInit();
    titleController = TextEditingController();
    locationController = TextEditingController();
    dateController = GenericDatepickerController();
    timeController = GenericTimePickerController();
    descriptionController = TextEditingController();
  }

  @override
  void onClose() {
    titleController.dispose();
    locationController.dispose();
    dateController.dispose();
    timeController.dispose();
    descriptionController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  void resetForm() {
    titleController.clear();
    locationController.clear();
    dateController.reset();
    timeController.reset();
    descriptionController.clear();
  }
}