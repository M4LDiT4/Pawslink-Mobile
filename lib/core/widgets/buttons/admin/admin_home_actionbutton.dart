import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/utils/device/device_utility.dart';
import 'package:mobile_app_template/core/widgets/ui_utils/fixed_seperator.dart';

enum AdminButtonType {
  normal,
  special
}

class AdminHomeActionButtons extends StatelessWidget {
  final VoidCallback onPress;
  final AdminButtonType type;
  final String label;
  const AdminHomeActionButtons({
    super.key,
    required this.onPress,
    required this.label,
    this.type = AdminButtonType.normal
  });

  ButtonStyle generateStyling(bool isDarkMode){
    if(type == AdminButtonType.normal){
      return ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(TSizes.borderRadiusxs)
        )
      );
    }
    return ElevatedButton.styleFrom(
      backgroundColor: isDarkMode? TColors.backgroundDark : TColors.backgroundLight,
      foregroundColor: isDarkMode? TColors.primaryDark : TColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(TSizes.borderRadiusxs),
      ),
      side: BorderSide(
        width: 2,
        color: isDarkMode? TColors.primaryDark : TColors.primary
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = TDeviceUtils.isDarkMode();
    return Column(
      children: [
        SizedBox(
          width: 290,
          height: 62,
          child: ElevatedButton(
            onPressed: onPress,
            style: generateStyling(isDarkMode),
            child:Text(label),
          ),
        ),
        const FixedSeparator(space: TSizes.spaceBetweenItems)
      ],
    );
  }
}