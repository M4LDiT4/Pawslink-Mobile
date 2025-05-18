
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_template/core/widgets/text_fields/modal_input_list/modal_input_list_controller.dart';
import 'package:mobile_app_template/core/widgets/text_fields/multivalue_text_input/multivalue_textinput_controller.dart';

class AddAnimalController extends GetxController {
  late GlobalKey<FormState> formKey;

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
    formKey = GlobalKey<FormState>();
  }

  void handleSubmit(){
    if(formKey.currentState!.validate()){
      //submit operation here
    }
  }
}