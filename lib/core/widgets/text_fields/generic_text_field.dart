import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/utils/device/device_utility.dart';

class GenericTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final bool obscureText;
  final TextInputType keyboardType;
  final int? maxLines;
  final int? maxLength;
  final bool enabled;
  final String? suffixText;
  final Function(String)? onChanged;
  final EdgeInsetsGeometry padding;
  final FormFieldValidator<String>? validator;
  final bool isRequired;
  final String? errMessage;
  final bool hasClearButton;

  const GenericTextField({
    Key? key,
    this.controller,
    this.hintText,
    required this.labelText,
    this.errorText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.maxLength,
    this.enabled = true,
    this.onChanged,
    this.padding = const EdgeInsets.all(8.0),
    this.suffixText,
    this.validator,
    this.errMessage,
    this.isRequired = false,
    this.hasClearButton = false,
  }) : super(key: key);

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: color, width: 2),
    );
  }

  void _handleClear(){
    if(controller == null){
      return;
    }
    controller!.text = "";
  }

  Widget? _renderSuffixIcon(bool isDarkMode){
    if(!hasClearButton){
      return  null;
    }
    return IconButton(
      onPressed: _handleClear, 
      icon: const Icon(Iconsax.close_circle4)
    );
  }

  Widget? _renderSuffixText(bool isDarkMode){
    if(suffixText == null) {
      return  null;
    }
    return Text(
      style: TextStyle(
        color: isDarkMode? TColors.textLight: TColors.textDark,
      ),
      suffixText!
    );
  }


  String _generateErrorMssg(){
    if(errMessage != null){
      return errMessage!;
    }
    return 'This field is required';
  }
  String? _validationFunction(String? value) {
    if (isRequired) {
      if (validator != null) {
        return validator!(value); // use ! to call a nullable function safely
      } else if (value == null || value.isEmpty) {
        return _generateErrorMssg();
      }
    }
    return null; // Make sure to return something for all paths
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = TDeviceUtils.isDarkMode();
    Color primaryColor = isDarkMode? TColors.primaryDark: TColors.primary;
    return Expanded(
      child: Padding(
        padding: padding,
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          maxLines: maxLines,
          maxLength: maxLength,
          enabled: enabled,
          onChanged: onChanged,
          validator: _validationFunction,
          decoration: InputDecoration(
            hintText: hintText,
            labelText: labelText,
            errorText: errorText,
            enabledBorder: _buildBorder(Colors.grey.shade400),
            focusedBorder: _buildBorder(primaryColor),
            errorBorder: _buildBorder(TColors.error),
            focusedErrorBorder: _buildBorder(TColors.warning),
            disabledBorder: _buildBorder(Colors.grey.shade300),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            suffix: _renderSuffixText(isDarkMode),
            suffixIcon: _renderSuffixIcon(isDarkMode),
            floatingLabelStyle: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            // This style applies when label is not floating (placeholder)
            labelStyle: TextStyle(
              color: Colors.grey.shade700,
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
            suffixIconConstraints:const BoxConstraints(
              minHeight: 32,
            ),
          ),
          cursorColor: primaryColor,
        ),
      ),
    );
  }
}
