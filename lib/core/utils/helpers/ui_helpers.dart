import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// ## TUIHelpers
/// Auxiliary class for generic UI 
class TUIHelpers {
  TUIHelpers._();

  static void showAlert(String title, String message){
    ///make this generic
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
  /// Shows a snackbar ui given with a message
  /// ### Parameters
  /// - **[message]**: message to be displayed in the snackbar
  /// ### Returns
  /// [void]
  static void showSnackBar(String message){
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Text(message),
      )
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

  static void showCustomDialog(Widget child, {bool isDismissible = true}){
    final context = Get.context!;
    showDialog(
      context: context,
      barrierDismissible: isDismissible,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        child: child
      )
    );
  }

  static void showStateSnackBar(String message, {
    String title = "Notice",
    SnackBarState state = SnackBarState.neutral,
    Duration duration = const Duration(seconds: 3),
  }) {
    Color backgroundColor;
    IconData icon;

    switch (state) {
      case SnackBarState.success:
        backgroundColor = Colors.green;
        icon = Icons.check_circle_outline;
        break;
      case SnackBarState.error:
        backgroundColor = Colors.red;
        icon = Icons.error_outline;
        break;
      default:
        backgroundColor = Colors.blueGrey;
        icon = Icons.info_outline;
        break;
    }

    Get.snackbar(
      title,
      message,
      backgroundColor: backgroundColor,
      colorText: Colors.white,
      icon: Icon(icon, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      duration: duration,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
    );
  }
}

enum SnackBarState { neutral, success, error }