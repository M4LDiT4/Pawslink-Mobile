import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/utils/device/device_utility.dart';
import 'package:mobile_app_template/core/utils/helpers/string_helper.dart';
import 'package:mobile_app_template/core/widgets/dropdowns/generic_dropdown_controller.dart';

class GenericDropdown<T extends Enum> extends StatefulWidget {
  final List<T> options;
  final String labelText;
  final String? errorText;
  final Function(T?)? onChanged;
  final EdgeInsetsGeometry padding;
  final String? suffixText;
  final bool isRequired;
  final String? Function(T? value)? validator;
  final GenericDropdownController<T>? controller;
  final T? initialValue;
  final bool useFilledStyle;

  const GenericDropdown({
    super.key,
    required this.options,
    required this.labelText,
    this.errorText,
    this.onChanged,
    this.padding = const EdgeInsets.all(8.0),
    this.suffixText,
    this.isRequired = false,
    this.validator,
    this.controller,
    this.initialValue,
    this.useFilledStyle = false,
  });

  @override
  State<GenericDropdown<T>> createState() => _GenericDropdownState<T>();
}

class _GenericDropdownState<T extends Enum> extends State<GenericDropdown<T>> {
  late final GenericDropdownController<T> _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _controller = (widget.controller ?? GenericDropdownController<T>())
      ..initialValue(widget.initialValue);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  OutlineInputBorder _buildBorder(Color color) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: color, width: 2),
      );

  Widget? _buildSuffixText(bool isDarkMode) {
    if (widget.suffixText == null) return null;
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(
        widget.suffixText!,
        style: TextStyle(
          color: isDarkMode ? TColors.textLight : TColors.textDark,
        ),
      ),
    );
  }

  String? _validate(T? value) {
    if (!widget.isRequired) return null;
    if (widget.validator != null) return widget.validator!(value);
    if (value == null) return "Required *";
    return null;
  }

  void _changeValue(T? value) {
    _controller.selectedValue = value;
    widget.onChanged?.call(value);
  }

  Future<void> _handleOnTap() async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (_controller.selectedValue == null) _focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = TDeviceUtils.isDarkMode();
    final Color primaryColor =
        isDarkMode ? TColors.primaryDark : TColors.primary;

    final inputDecoration = widget.useFilledStyle
        ? InputDecoration(
            labelText: widget.labelText,
            errorText: widget.errorText,
            filled: true,
            // use Material defaults but inject theme-based background
            fillColor: isDarkMode
                ? Colors.grey.shade900
                : Colors.grey.shade100,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none, // Material filled default
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: primaryColor, width: 2),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
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
            suffix: _buildSuffixText(isDarkMode),
          )
        : InputDecoration(
            labelText: widget.labelText,
            errorText: widget.errorText,
            enabledBorder: _buildBorder(Colors.grey.shade400),
            focusedBorder: _buildBorder(primaryColor),
            errorBorder: _buildBorder(TColors.error),
            focusedErrorBorder: _buildBorder(TColors.warning),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
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
            suffix: _buildSuffixText(isDarkMode),
          );

    return Expanded(
      child: Padding(
        padding: widget.padding,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) => DropdownButtonFormField<T>(
            value: _controller.selectedValue,
            isExpanded: true,
            validator: _validate,
            onTap: _handleOnTap,
            onChanged: _changeValue,
            decoration: inputDecoration,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: isDarkMode ? TColors.textLight : TColors.textDark,
            ),
            items: [
              DropdownMenuItem<T>(
                value: null,
                child: Text(
                  "None",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              ...widget.options.map((T value) {
                return DropdownMenuItem<T>(
                  value: value,
                  child: Text(
                    TStringHelpers.camelCaseToWords(value.name),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
