
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile_app_template/core/dependency_injection/dependency_injection.dart';
import 'package:mobile_app_template/core/utils/http/response.dart';
import 'package:mobile_app_template/core/widgets/pickers/date_pickers/generic_datepicker_controller.dart';
import 'package:mobile_app_template/core/widgets/pickers/img_pickers/generic_img_picker_controller.dart';
import 'package:mobile_app_template/core/widgets/pickers/time_pickers/generic_time_picker_controller.dart';
import 'package:mobile_app_template/data/local_storage/isar/repositories/event_repository.dart';

class Addeventcontroller extends GetxController{
  late GlobalKey<FormState> key = GlobalKey<FormState>();
  
  late TextEditingController titleController;
  late TextEditingController locationController;
  late GenericDatepickerController dateController;
  late GenericTimePickerController timeController;
  late TextEditingController descriptionController;
  late GenericImgPickerController imgPickerController;
  late EventRepository repo;

  @override
  void onInit() {
    super.onInit();
    titleController = TextEditingController();
    locationController = TextEditingController();
    dateController = GenericDatepickerController();
    timeController = GenericTimePickerController();
    descriptionController = TextEditingController();
    imgPickerController = GenericImgPickerController();
    repo = getIt.get<EventRepository>();
  }

  @override
  void onClose() {
    titleController.dispose();
    locationController.dispose();
    dateController.dispose();
    timeController.dispose();
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

  bool validate(){
    timeController.validate();
    dateController.validate();
    if(key.currentState!.validate() 
      && imgPickerController.selectedImage != null
      && dateController.isValid
      && timeController.isValid
    ){
      return true;
    }
    return false;
  }

  Future<TResponse> saveEvent() async{
    return repo.addEvent(
      titleController.text, 
      descriptionController.text, 
      dateController.selectedDate!, 
      timeController.selectedTimeInMinutes!, 
      await imgPickerController.selectedImage!.readAsBytes()     
    );
  }
   
}