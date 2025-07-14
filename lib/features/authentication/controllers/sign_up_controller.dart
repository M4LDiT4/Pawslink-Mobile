
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobile_app_template/core/navigation/routes/app_routes.dart';
import 'package:mobile_app_template/core/utils/http/response.dart';
import 'package:mobile_app_template/core/utils/validation/validator.dart';
import 'package:mobile_app_template/core/widgets/dialogs/animated_dialog.dart';
import 'package:mobile_app_template/core/widgets/dialogs/loading_dialog/loading_dialog.dart';
import 'package:mobile_app_template/services/api/authentication.dart';
import 'package:mobile_app_template/services/navigation/navigation_service.dart';

class SignUpControiller extends GetxController {

  final formKey = GlobalKey<FormState>();
  final TextEditingController passController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();


  void _navigateToHome(){
    // todo: check if what type of user is currently logged in
    // todo: if admin, go to admin home otherwise go to user home

    //goto to admin home for now
    TNavigationService.offAllNamed(TAppRoutes.home);
  }

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
          successFuction: _navigateToHome,
          asyncFunction: _registerUser,
        )
      );
    }
  }

  String? validateConfirmPass(String? value){
    return TValidator.validateConfirmPass(value, passController.text);
  }
}