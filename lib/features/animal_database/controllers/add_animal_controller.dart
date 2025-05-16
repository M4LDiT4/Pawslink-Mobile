
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_template/core/widgets/text_fields/chip_text_input/multivalue_textinput_controller.dart';

class AddAnimalController extends GetxController {
  late GlobalKey<FormState> formKey;

  late MultiValueTextfieldController coatColorController;

  @override
  void onInit(){
    super.onInit();
    coatColorController = MultiValueTextfieldController();
    formKey = GlobalKey<FormState>();
  }

  void handleSubmit(){
    if(formKey.currentState!.validate()){
      //submit operation here
    }
  }
}