import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';

enum FormButtonType{
  confirm,
  cancel,
}

class FormButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final FormButtonType type;
  final bool widthFixed;
  FormButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.type = FormButtonType.confirm,
    this.widthFixed = false
  });

  final _baseStyle = ElevatedButton.styleFrom(
    padding: const EdgeInsets.all(8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    )
  );

  ButtonStyle _generateStyle(){
    if(type == FormButtonType.confirm){
      return _baseStyle;
    }
    return _baseStyle.copyWith(
      backgroundColor:const WidgetStatePropertyAll(TColors.backgroundLight),
      foregroundColor: const WidgetStatePropertyAll(TColors.primary),
      side: const WidgetStatePropertyAll(BorderSide(
        width: 2,
        color: TColors.primary
      ))
    );
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.only(left: TSizes.paddingsm),
      child: SizedBox(
        width: widthFixed? 136: null,
        height: 38,
        child: ElevatedButton(
          onPressed: onPressed, 
          style: _generateStyle(),
          child:  child,
        ),
      ),
    );
  }
}