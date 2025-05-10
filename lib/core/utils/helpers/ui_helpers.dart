///@file ui_helpers.dart
///@description : provides functions to generate auxiliary ui widgets
///@usage : TUIHelpers.function();
///@example : TUIHelpers.showAlert(title, message);
///@note : usage of this helper class is highly encouraged
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TUIHelpers {
  TUIHelpers._();
  
  ///@description : shows alert widge
  ///@args : {String} title -> title of the alert
  ///@args : {String} message -> message of the alert
  ///@return : {void}
  static void showAlert(String title, String message){
    showDialog(
      context: Get.context!, 
      builder: (BuildContext context){
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), 
              child: const Text('OK')
            )
          ],
        );
      }
    );
  }

  ///@description: shows a snackbar ui given a message
  ///@args : {String} message -> message of the snackbar
  ///@return : {null}
  static void showSnackBar(String message){
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(content: Text(message))
    );
  }  

  ///@description: shows a confirmation dialog
  ///@args : {String} title -> title of the dialog
  ///@args : {String} message -> message of the dialog
  ///@args : {String || null} -> string text for the confirm button, defaults to 'Yes'
  ///@args " {String || null} -> string text for the cancelButton, defaults to 'no'
  ///@return : {bool} -> the user agress or not
  static Future<bool> showConfirmationDialog({
    required String title,
    required String message,
    String confirmText = 'Yes',
    String cancelText = 'no'
    }) async{
      final context = Get.context!;
      final result = await showDialog<bool>(
        context: context, 
        builder: (_) => AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: ()=> Navigator.of(context).pop(), 
              child: Text(cancelText)
            ),
            TextButton(
              onPressed:() => Navigator.of(context).pop(true), 
              child: Text(confirmText)
            )
          ],
        )
      );
      return result ?? false;
  }

  ///@description : shows a bottomsheet with the child as the content
  ///@args : {Widget} -> widget to be displayed on the bottomsheet
  ///@return : {void}
  static void showCustomBottomSheet(Widget child){
    final context = Get.context!;
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20))
      ),
      builder: (_) => child
    );
  }
}