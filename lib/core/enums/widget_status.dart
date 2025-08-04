import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/utils/device/device_utility.dart';
import 'package:mobile_app_template/core/utils/helpers/number_helpers.dart';

enum WidgetStatus {
  idle,
  focused,
  valid,
  invalid,
  validating,
  disabled,
  error,
  loading,
}


extension WidgetStatusColorExtension on WidgetStatus {
  Color color() {
    final isDark = TDeviceUtils.isDarkMode();
    switch (this) {
      case WidgetStatus.idle:
        return isDark ? Colors.grey[700]! : Colors.grey[300]!;
      case WidgetStatus.focused:
        return isDark ? TColors.primaryDark.withAlpha(TNumberHelper.getAlphaWithOpacity(0.3)) : TColors.primary;
      case WidgetStatus.valid:
        return isDark ? Colors.greenAccent[400]! : Colors.green;
      case WidgetStatus.invalid:
        return isDark ? Colors.red[300]! : Colors.red;
      case WidgetStatus.validating:
        return isDark ? Colors.orangeAccent : Colors.orange;
      case WidgetStatus.disabled:
        return isDark ? Colors.grey[800]! : Colors.grey[400]!;
      case WidgetStatus.error:
        return isDark ? Colors.redAccent[100]! : Colors.redAccent;
      default:
        return (isDark ? TColors.info : TColors.info).withAlpha(TNumberHelper.getAlphaWithOpacity(0.6));
    } 
  }
}
