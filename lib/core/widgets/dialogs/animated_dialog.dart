import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/network/response.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';

class AnimatedDialog {

  static Widget _buildChild(Widget child, BuildContext context, bool canPop) {
    return PopScope(
      canPop: canPop,
      child: Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultScreenPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding:const EdgeInsets.all(16),
                  child: child,
                ),
              ),
            )
          ],
        ),
      )
    ),
  );
  }

  /// ## show
  /// Shows an animated dialog enclosed in a [Card] [Material]
  /// 
  /// ### Parameters
  /// - **[label]**: makes the dialog accessible to screen readers
  /// - **[child]**: [Widget] object that will be displayed inside the dialog
  /// - **[isDismissible]**: determines if the dialog can be popped by clicking outside of it
  /// - **[barrierColor]**: color of the area outside of the dialog. Defaults to [Colors.black54]
  /// - **[isCancellable]**: clicking back button removes the dialog from the navigation stack. Defaults to true
  /// ### Returns
  /// [TResponse] object that should be passed by the dialog using `TNavigationService.back(result: <TResponse object>)`
  static Future<TResponse<T>> show<T>(
    BuildContext context, {
      String label = "Dialog",
      required Widget child,
      bool isDismissible = false,
      Color? barrierColor,
      bool isCancellable = true
    }
    ) async{
      try{
        final result = await Get.dialog<T>(
          _buildChild(child, context, isCancellable),
          barrierDismissible: false,
          barrierColor: barrierColor,
          transitionDuration: const Duration(milliseconds: 300),
          transitionCurve: Curves.easeOutBack,
          useSafeArea: true,
        );

        final response = result as TResponse<T>;
        return response;
        //catches parsing error
      }catch(e){
        TLogger.error(e.toString());
        return TResponse.failed();
      }
  }
}
