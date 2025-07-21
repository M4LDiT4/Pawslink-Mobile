
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile_app_template/core/widgets/pickers/date_pickers/generic_datepicker_controller.dart';
import 'package:mobile_app_template/core/widgets/pickers/img_pickers/generic_img_picker_controller.dart';
import 'package:mobile_app_template/core/widgets/pickers/time_pickers/generic_time_picker_controller.dart';

class Addeventcontroller extends GetxController{
  late GlobalKey<FormState> key = GlobalKey<FormState>();
  
  late TextEditingController titleController;
  late TextEditingController locationController;
  late GenericDatepickerController dateController;
  late GenericTimePickerController timeController;
  late TextEditingController descriptionController;
  late GenericImgPickerController imgPickerController;

  @override
  void onInit() {
    super.onInit();
    titleController = TextEditingController();
    locationController = TextEditingController();
    dateController = GenericDatepickerController();
    timeController = GenericTimePickerController();
    descriptionController = TextEditingController();
    imgPickerController = GenericImgPickerController();
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

  //define save operations here
   
}