import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';

class AnimatedDialog {

  static Widget _buildChild(Widget child, BuildContext context) {
    return Material(
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
                  padding:const EdgeInsets.all(8),
                  child: child,
                ),
              ),
            )
          ],
        ),
      )
    );
  }
  static Future<T?> show<T>(
    BuildContext context, {
      String label = "Dialog",
      required Widget child,
      bool isDismissible = false,
      Color? barrierColor
    }
    ) {
    return Get.dialog<T>(
      _buildChild(child, context),
      barrierDismissible: false,
      barrierColor: barrierColor,
      transitionDuration: const Duration(milliseconds: 300),
      transitionCurve: Curves.easeOutBack,
      useSafeArea: true,
    );
  }
}
