
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobile_app_template/core/utils/http/response.dart';
import 'package:mobile_app_template/core/widgets/dialogs/animated_dialog.dart';
import 'package:mobile_app_template/core/widgets/dialogs/loading_dialog/loading_dialog.dart';
import 'package:mobile_app_template/services/api/authentication.dart';

class SignInController extends GetxController{
  final formkey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<TResponse> _signIn()async{
    await TAuthenticationService().init();
    final response = await TAuthenticationService().signIn(
      usernameController.text,
      passwordController.text
    );

    return response;
  }


  void submit(BuildContext context) async{
    if(formkey.currentState!.validate()){
      AnimatedDialog.show(
        context, 
        child: LoadingDialog(
          asyncFunction: _signIn,
        )
      );
    }
  }
}