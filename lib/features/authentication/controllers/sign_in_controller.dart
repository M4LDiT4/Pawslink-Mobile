
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobile_app_template/core/navigation/routes/app_routes.dart';
import 'package:mobile_app_template/core/utils/helpers/ui_helpers.dart';
import 'package:mobile_app_template/core/widgets/dialogs/async_generic_loader/async_generic_loader.dart';
import 'package:mobile_app_template/domain/services/authentication/app_authentication_service.dart';
import 'package:mobile_app_template/network/operation_response.dart';

class SignInController extends GetxController{
  final formkey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<OperationResponse> _signIn()async{
    final response = await AppAuthenticationService().signIn(
      usernameController.text,
      passwordController.text
    );

    return response;
  }


  void submit(BuildContext context) async{
    if(formkey.currentState!.validate()){
      final response = await TUIHelpers.showResponsiveModal(
        isDismissible: false,
        child: AsyncGenericLoader(

          asyncFunction: _signIn
        ) 
      );
      if(response.isSuccessful){
        Get.offAllNamed(TAppRoutes.home);
      }else {
        TUIHelpers.showStateSnackBar(
          "Failed to sign in", 
          state: SnackBarState.error,
          snackPosition: SnackPosition.TOP
        );
      }
    }
  }
}