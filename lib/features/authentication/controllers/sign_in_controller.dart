
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobile_app_template/core/navigation/routes/app_routes.dart';
import 'package:mobile_app_template/core/utils/helpers/ui_helpers.dart';
import 'package:mobile_app_template/network/response.dart';
import 'package:mobile_app_template/core/widgets/dialogs/animated_dialog.dart';
import 'package:mobile_app_template/core/widgets/dialogs/loading_dialog/loading_dialog.dart';
import 'package:mobile_app_template/services/api/authentication.dart';

class SignInController extends GetxController{
  final formkey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<TResponse> _signIn()async{
    final response = await TAuthenticationService().signIn(
      usernameController.text,
      passwordController.text
    );

    return response;
  }


  void submit(BuildContext context) async{
    if(formkey.currentState!.validate()){
      final response = await AnimatedDialog.show(
        context, 
        child: LoadingDialog(
          asyncFunction: _signIn,
        )
      );
      if(response.isSuccessful){
        Get.offAllNamed(TAppRoutes.home);
      }else {
        TUIHelpers.showStateSnackBar("Failed to sign in", state: SnackBarState.error);
      }
    }
  }
}