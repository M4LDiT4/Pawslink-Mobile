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

  @override
  State<GenericTextField> createState() => _GenericTextFieldState();
}

class _GenericTextFieldState extends State<GenericTextField> {
  late final TextEditingController _controller;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _hasText = _controller.text.isNotEmpty;
    _controller.addListener(() {
      if (_hasText != _controller.text.isNotEmpty) {
        setState(() {
          _hasText = _controller.text.isNotEmpty;
        });
      }
    });
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _handleClear() {
    _controller.clear();
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
          controller: _controller,
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          enabled: widget.enabled,
          onChanged: widget.onChanged,
          validator: _validationFunction,
          cursorColor: primaryColor,
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
