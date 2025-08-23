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
    SnackPosition snackPosition = SnackPosition.BOTTOM
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
      snackPosition: snackPosition,
      duration: duration,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
    );
  }

  static Future<T?> showResponsiveModal<T>({
    required Widget child,
    bool isDismissible = true,
    T? arguments
  }) {
    return Get.dialog<T>(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                // Max height 80% of screen
                maxHeight: MediaQuery.of(context).size.height * 0.8,
                maxWidth: MediaQuery.of(context).size.width * 0.95,
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(16),
                child: child,
              ),
            );
          },
        ),
      ),
      arguments: arguments,
      barrierDismissible: isDismissible,
    );
  }

  static Future<T?> showDefaultDialog<T>(
    Widget child, {
    bool isDismissible = false,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    String? title,
    String confirmText = "Confirm",
    String cancelText = "Cancel",
  }) {
    return Get.defaultDialog<T>(
      title: title ?? "",
      titlePadding: const EdgeInsets.only(top: 16),
      content: PopScope(
        canPop: isDismissible,
        child: child,
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {
                  if(onCancel != null) onCancel();
                  Get.back(result: false);
                } ,
                child:  Text(cancelText),
              ),
            ),
            Container(
              width: 1,
              height: 20,
              color: Colors.grey, // divider
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  if(onConfirm != null) onConfirm();
                  Get.back(result: true);
                },
                child: Text(confirmText),
              ),
            ),
          ],
        ),
      ],
    );
  }

}

enum SnackBarState { neutral, success, error }