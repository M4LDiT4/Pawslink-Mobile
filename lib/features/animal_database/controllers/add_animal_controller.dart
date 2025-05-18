
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_template/core/widgets/dropdowns/generic_dropdown_controller.dart';
import 'package:mobile_app_template/core/widgets/pickers/img_pickers/generic_img_picker_controller.dart';
import 'package:mobile_app_template/core/widgets/text_fields/modal_input_list/modal_input_list_controller.dart';
import 'package:mobile_app_template/core/widgets/text_fields/multivalue_text_input/multivalue_textinput_controller.dart';

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

  //complex input controllers
  late MultiValueTextfieldController coatColorController;
  late MultiValueTextfieldController notesController;
  late MultiValueTextfieldController traitsController;
  late ModalInputListController vaxController;
  late ModalInputListController medController;

  @override
  void onInit(){
    super.onInit();
    coatColorController = MultiValueTextfieldController();
    notesController = MultiValueTextfieldController();
    traitsController = MultiValueTextfieldController();
    vaxController = ModalInputListController();
    medController = ModalInputListController();
    nameController = TextEditingController();
    locationController = TextEditingController();
    ageController = TextEditingController();
    sexController = GenericDropdownController();
    speciesController = GenericDropdownController();
    statusController = GenericDropdownController();
    imgPickerController = GenericImgPickerController();
    formKey = GlobalKey<FormState>();
  }

  @override
  void onClose(){
    coatColorController.dispose();
    notesController.dispose();
    traitsController.dispose();
    vaxController.dispose();
    medController.dispose();
    nameController.dispose();
    locationController.dispose();
    locationController.dispose();
    ageController.dispose();
    sexController.dispose();
    speciesController.dispose();
    statusController.dispose();
    super.onClose();
  }

  void handleSubmit(){
    if(formKey.currentState!.validate()){
      //submit operation here
    }
  }
}