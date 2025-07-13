import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/utils/device/device_utility.dart';

class GenericTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final bool obscureText;
  final TextInputType keyboardType;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final bool enabled;
  final String? suffixText;
  final Function(String)? onChanged;
  final EdgeInsetsGeometry padding;
  final FormFieldValidator<String>? validator;
  final bool isRequired;
  final String? errMessage;
  final bool hasClearButton;
  final bool focusOnCreate;

  const GenericTextField({
    Key? key,
    this.controller,
    this.hintText,
    required this.labelText,
    this.errorText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.enabled = true,
    this.onChanged,
    this.padding = const EdgeInsets.all(8.0),
    this.suffixText,
    this.validator,
    this.errMessage,
    this.isRequired = false,
    this.hasClearButton = false,
    this.focusOnCreate = false,
  }) : super(key: key);

  @override
  State<GenericTextField> createState() => _GenericTextFieldState();
}

class _GenericTextFieldState extends State<GenericTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _hasText = false;

  @override
  void initState() {
    super.initState();

    if(widget.hasClearButton && widget.controller != null){
      widget.controller!.addListener(() {
        if (_hasText != widget.controller!.text.isNotEmpty) {
          setState(() {
            _hasText = widget.controller!.text.isNotEmpty;
          });
        }
      });
    }
    if(widget.focusOnCreate){
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusNode.requestFocus();
      });
    }
  }


  void _handleClear() {
    if(widget.controller != null){
      widget.controller!.clear();
    }
    if (widget.onChanged != null) {
      widget.onChanged!('');
    }
  }

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: color, width: 2),
    );
  }

  Widget? _renderSuffixIcon(bool isDarkMode) {
    if (!widget.hasClearButton || !_hasText) return null;

    return IconButton(
      onPressed: _handleClear,
      icon: const Icon(Iconsax.close_circle4),
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(minHeight: 32, minWidth: 32),
      splashRadius: 20,
      color: isDarkMode ? TColors.textLight : TColors.textDark,
    );
  }

  Widget? _renderSuffixText(bool isDarkMode) {
    if (widget.suffixText == null) return null;
    return Text(
      widget.suffixText!,
      style: TextStyle(
        color: isDarkMode ? TColors.textLight : TColors.textDark,
      ),
    );
  }

  String _generateErrorMssg() {
    return widget.errMessage ?? 'Required';
  }

  String? _validationFunction(String? value) {
    if (widget.isRequired) {
      if (widget.validator != null) {
        return widget.validator!(value);
      } else if (value == null || value.isEmpty) {
        return _generateErrorMssg();
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = TDeviceUtils.isDarkMode();
    final primaryColor = isDarkMode ? TColors.primaryDark : TColors.primary;

    return Expanded(
      child: Padding(
        padding: widget.padding,
        child: TextFormField(
          controller: widget.controller,
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          maxLength: widget.maxLength,
          enabled: widget.enabled,
          onChanged: widget.onChanged,
          validator: _validationFunction,
          cursorColor: primaryColor,
          focusNode: _focusNode,
          decoration: InputDecoration(
            hintText: widget.hintText,
            labelText: widget.labelText,
            errorText: widget.errorText,
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
            labelStyle: TextStyle(
              color: Colors.grey.shade700,
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
