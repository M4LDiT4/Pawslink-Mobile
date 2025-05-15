
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAnimalController extends GetxController {
  final formKey = GlobalKey<FormState>();

  void handleSubmit(){
    if(formKey.currentState!.validate()){
      //submit operation here
    }
  }
}