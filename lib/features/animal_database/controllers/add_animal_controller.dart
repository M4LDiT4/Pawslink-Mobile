

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_template/core/widgets/dropdowns/generic_dropdown_controller.dart';
import 'package:mobile_app_template/core/widgets/pickers/date_pickers/generic_datepicker_controller.dart';
import 'package:mobile_app_template/core/widgets/pickers/img_pickers/generic_img_picker_controller.dart';
import 'package:mobile_app_template/core/widgets/text_fields/tag_input/tag_input_controller.dart';

class AddAnimalController extends GetxController {
  late GlobalKey<FormState> formKey;

  //image picker controller
  late GenericImgPickerController imgPickerController;

  //form controllers;
  late TextEditingController nameController;
  late TextEditingController locationController;
  late TextEditingController ageController;
  late GenericDropdownController sexController;
  late GenericDropdownController speciesController;
  late GenericDropdownController statusController;
  late GenericDatepickerController sterilizationDateController;


  //
  late TagInputController coatController;
  late TagInputController traitsController;
  late TagInputController notesController;

  final RxBool _isSterilized = false.obs;

  @override
  void onInit(){
    super.onInit();
    nameController = TextEditingController();
    locationController = TextEditingController();
    ageController = TextEditingController();
    sexController = GenericDropdownController();
    speciesController = GenericDropdownController();
    statusController = GenericDropdownController();
    imgPickerController = GenericImgPickerController();
    formKey = GlobalKey<FormState>();
    sterilizationDateController = GenericDatepickerController();
    coatController = TagInputController();
    traitsController = TagInputController();
    notesController = TagInputController();
  }

  @override
  void onClose(){
    nameController.dispose();
    locationController.dispose();
    ageController.dispose();
    sexController.dispose();
    speciesController.dispose();
    statusController.dispose();
    super.onClose();
  }

  void handleSubmit(){
    // bool isFormValid = formKey.currentState!.validate();
    // bool isImageValid = imgPickerController.validate();
    // bool isSterilizationValid = sterilizationDateController.validate();
    // if(isFormValid && isImageValid && isSterilizationValid){
    //   final params = AddAnimalSummaryParams(
    //     name: nameController.text , 
    //     age: ageController.text, 
    //     location: locationController.text, 
    //     sex: sexController.selectedValue!, 
    //     species: speciesController.selectedValue!, 
    //     status: statusController.selectedValue!,
    //     coatColor: coatColorController.getStringValues(),
    //     notes: notesController.getStringValues(),
    //     traits: traitsController.getStringValues(),
    //     vaccinations: vaxController.getValue(),
    //     medications: medController.getValue(),
    //     animalImage: imgPickerController.selectedImage,
    //     sterilizationDate: _isSterilized.value? sterilizationDateController.selectedDate : null,
    //   );
    //   TNavigationService.toNamed(TAppRoutes.addAnimalSummary, arguments: params);
    // }
  }

  bool get isSterilized => _isSterilized.value;

  void setIsSterilized(bool? value){
    if(value == null) return;
    _isSterilized.value = value;
  }
}