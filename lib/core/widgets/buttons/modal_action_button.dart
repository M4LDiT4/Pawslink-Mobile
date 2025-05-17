import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/utils/device/device_utility.dart';

enum ModalActionButtonType {
  cancel,
  confirm
}

class ModalActionButton extends StatelessWidget {
  final List<Widget> children;
  final VoidCallback onPressed;
  final ModalActionButtonType type;
  const ModalActionButton({
    super.key,
    required this.children,
    required this.onPressed,
    required this.type
  });

  ButtonStyle? _generateButtonStyle(bool isDarkMode){
    if(type == ModalActionButtonType.confirm){
      return null;
    }
    return ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(isDarkMode? TColors.backgroundDark : TColors.backgroundLight),
        foregroundColor: WidgetStatePropertyAll(isDarkMode? TColors.primaryDark : TColors.primary),
        side: WidgetStatePropertyAll(BorderSide(
          color: isDarkMode? TColors.primaryDark : TColors.primary,
          width: 2
        ))

    );
  } 

  @override
  Widget build(BuildContext context) {
    final isDarkMode = TDeviceUtils.isDarkMode();
    return SizedBox(
      child: ElevatedButton(
        onPressed: onPressed, 
        style: _generateButtonStyle(isDarkMode),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        )
      )
    );
  }
}