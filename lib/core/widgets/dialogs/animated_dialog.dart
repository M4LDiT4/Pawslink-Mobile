import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/utils/helpers/number_helpers.dart';

class AnimatedDialog {
  static void show(
    BuildContext context, {
    String label = "Dialog",
    required Widget child,
    bool isDismissible = false, //the dialog cannot be dismissed by clicking the gray part by default
    
  }) {
    showGeneralDialog(
      context: context,
      barrierLabel: label,
      barrierDismissible: isDismissible,
      barrierColor: Colors.black.withAlpha(
        TNumberHelper.getAlphaWithOpacity(0.5),
      ),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return const SizedBox.shrink(); // Required but unused
      },
      transitionBuilder: (context, animation, secondaryAnimation, _) {
        final curvedValue = Curves.easeOutBack.transform(animation.value);

        return Transform.scale(
          scale: 0.8 + 0.2 * curvedValue,
          child: Opacity(
            opacity: animation.value,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultScreenPadding),
              child: Center(
                child: Material(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: child
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
