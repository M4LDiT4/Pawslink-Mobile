import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/utils/colors/color_utils.dart';
import 'package:mobile_app_template/core/utils/device/device_utility.dart';

class UtilityButton extends StatelessWidget {
  final void Function() onPress;
  final Widget child;
  const UtilityButton({
    super.key,
    required this.onPress,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = TDeviceUtils.isDarkMode();
    return ElevatedButton(
      onPressed: onPress, 
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(TSizes.paddingmd),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: TColorUtils.surface(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(TSizes.borderRadiussm)
        ),
        side: BorderSide(
          color: isDarkMode? TColors.primaryDark: TColors.primary,
          width: 2,
        )
      ),
      child: child,
    );
  }
}