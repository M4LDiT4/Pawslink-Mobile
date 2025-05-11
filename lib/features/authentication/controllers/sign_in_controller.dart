
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';

class SignInController extends GetxController{
  final formkey = GlobalKey<FormState>();

  void submit() async{
    if(formkey.currentState!.validate()){
      TLogger.info('values are valud');
    }
  }
}