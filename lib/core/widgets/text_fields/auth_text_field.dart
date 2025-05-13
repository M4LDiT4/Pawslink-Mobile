import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/utils/device/device_utility.dart';
import 'package:mobile_app_template/core/widgets/ui_utils/fixed_seperator.dart';

class AuthTextField extends StatefulWidget {
  final String label;
  final bool isPassword;
  final IconData? leadingIcon;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool isRequired;
  final String? errMessage;
  final bool enableAutoCorrect;
  final TextInputType keyboardType;

  const AuthTextField({
    super.key,
    required this.label,
    this.controller,
    this.leadingIcon,
    this.isPassword = false,
    this.validator,
    this.isRequired = false,
    this.errMessage,
    this.enableAutoCorrect = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  final FocusNode _focusNode = FocusNode();
  bool showPassword = false;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  void toggleValueVisibility(){
    setState(() {
      showPassword = !showPassword;
    });
  }
  String generateErrorMssg(){
    if(widget.errMessage != null){
      return widget.errMessage!;
    }
    return 'This field is required';
  }
  String? validationFunction(String? value) {
    if (widget.isRequired) {
      if (widget.validator != null) {
        return widget.validator!(value); // use ! to call a nullable function safely
      } else if (value == null || value.isEmpty) {
        return generateErrorMssg();
      }
    }
    return null; // Make sure to return something for all paths
  }

  bool showText () {
    if(!widget.isPassword){
      return true;
    }
    return showPassword;
  }



  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = TDeviceUtils.isDarkMode();
    final primaryColor = isDarkMode ? TColors.primaryDark : TColors.primary;

    return Column(
      children: [
        TextFormField(
          focusNode: _focusNode,
          controller: widget.controller,
          obscureText: !showText(),
          autocorrect: widget.enableAutoCorrect,
          validator: validationFunction,
          enableSuggestions: false,
          textCapitalization: TextCapitalization.none,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            label: Text(
              style: TextStyle(color: _isFocused? isDarkMode? TColors.primaryDark : TColors.primary: TColors.textMuted),
              widget.label
            ),
            prefixIcon: widget.leadingIcon != null
                ? Icon(
                    widget.leadingIcon,
                    color: _isFocused ? primaryColor : Colors.grey,
                  )
                : null,
            suffixIcon: widget.isPassword?IconButton(
              onPressed: toggleValueVisibility, 
              icon: Icon(showPassword? Iconsax.eye_slash: Iconsax.eye)): null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(TSizes.roundedTextFieldBorderRadius),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(TSizes.roundedTextFieldBorderRadius),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(TSizes.roundedTextFieldBorderRadius),
              borderSide: BorderSide(color: primaryColor, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(TSizes.roundedTextFieldBorderRadius),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(TSizes.roundedTextFieldBorderRadius),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
          ),
        ),
        const FixedSeparator(space: TSizes.spaceBetweenItems)
      ],
    );
  }
}
