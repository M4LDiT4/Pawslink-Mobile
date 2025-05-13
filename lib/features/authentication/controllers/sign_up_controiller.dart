
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobile_app_template/core/utils/validation/validator.dart';

class SignUpControiller extends GetxController {

  final formKey = GlobalKey<FormState>();
  final TextEditingController passController = TextEditingController();

  void validate(){
    if(formKey.currentState!.validate()){

    }
  }

  String? validateConfirmPass(String? value){
    return TValidator.validateConfirmPass(value, passController.text);
  }
}