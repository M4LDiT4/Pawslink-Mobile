import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/utils/device/device_utility.dart';
import 'package:mobile_app_template/core/widgets/text_fields/chip_text_input/multivalue_textfield.dart';

class TrailingButton extends StatelessWidget {
  final ActionButtonMode mode;
  final VoidCallback onPress;
  TrailingButton({
    super.key,
    required this.onPress,
    required this.mode,
  });

  IconData _generateIconData(){
    if(mode == ActionButtonMode.add){
      return Iconsax.add;
    }
    return Iconsax.minus;
  }

  Icon _generateIcon(bool isDarkMode){
    Color color = TColors.textLight;
    if(mode == ActionButtonMode.delete){
      if(isDarkMode){
        color = TColors.primaryDark;
      }else{
        color = TColors.primary;
      }
    }

    return Icon(
      color: color,
      size: TSizes.iconxxl,
      _generateIconData()
    );
  }

  final ButtonStyle _baseButtonStyle = ElevatedButton.styleFrom(
    padding: EdgeInsets.zero,       // No inner padding
    minimumSize: Size.zero,         // No default minimum width/height
    tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Tight touch area
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(TSizes.borderRadiussm)
    ),
  );

  ButtonStyle _generateButtonStyle (bool isDarkMode){
    if(mode == ActionButtonMode.add){
      return _baseButtonStyle;
    }
    return _baseButtonStyle.copyWith(
      backgroundColor: WidgetStatePropertyAll(isDarkMode? TColors.backgroundDark : TColors.backgroundLight),
      side: WidgetStatePropertyAll(BorderSide(
        color:isDarkMode? TColors.primaryDark : TColors.primary,
        width: 2 )
      ),
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(TSizes.borderRadiussm),
        )
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    final isDarkMode = TDeviceUtils.isDarkMode();
    return ElevatedButton(
        style: _generateButtonStyle(isDarkMode),
        onPressed: onPress, 
        child: _generateIcon(isDarkMode)
      );
  }
}