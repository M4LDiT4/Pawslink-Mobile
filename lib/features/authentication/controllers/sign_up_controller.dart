
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobile_app_template/core/utils/http/response.dart';
import 'package:mobile_app_template/core/utils/validation/validator.dart';
import 'package:mobile_app_template/core/widgets/dialogs/animated_dialog.dart';
import 'package:mobile_app_template/core/widgets/dialogs/loading_dialog/loading_dialog.dart';
import 'package:mobile_app_template/services/api/authentication.dart';

class SignUpControiller extends GetxController {

  final formKey = GlobalKey<FormState>();
  final TextEditingController passController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  Future<TResponse> _registerUser()async{
    final response = await TAuthenticationService().signUp(
      usernameController.text, 
      emailController.text, 
      passController.text 
    );
    return response;
  }

  void validate(BuildContext context) async{
    if(formKey.currentState!.validate()){
      AnimatedDialog.show(
        context, 
        child: LoadingDialog(
          asyncFunction: _registerUser,
        )
      );
    }
  }

  String? validateConfirmPass(String? value){
    return TValidator.validateConfirmPass(value, passController.text);
  }
}