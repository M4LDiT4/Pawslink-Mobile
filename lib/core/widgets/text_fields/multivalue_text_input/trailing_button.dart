import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/utils/colors/color_utils.dart';
import 'package:mobile_app_template/core/widgets/text_fields/multivalue_text_input/multivalue_textfield.dart';

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

  Icon _generateIcon(){
    Color color = TColors.textLight;
    if(mode == ActionButtonMode.delete){
      color = TColorUtils.primary();
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

  ButtonStyle _generateButtonStyle (){
    if(mode == ActionButtonMode.add){
      return _baseButtonStyle;
    }
    return _baseButtonStyle.copyWith(
      backgroundColor: WidgetStatePropertyAll(TColorUtils.surface()),
      side: WidgetStatePropertyAll(BorderSide(
        color:TColorUtils.primary(),
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
    return ElevatedButton(
        style: _generateButtonStyle(),
        onPressed: onPress, 
        child: _generateIcon()
      );
  }
}