import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/utils/device/device_utility.dart';
import 'package:mobile_app_template/core/utils/helpers/string_helper.dart';
import 'package:mobile_app_template/core/widgets/dropdowns/generic_dropdown_controller.dart';

class GenericDropdown<T extends Enum> extends StatefulWidget {
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
  });

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

  @override
  State<GenericDropdown<T>> createState() => _GenericDropdownState<T>();
}

class _GenericDropdownState<T extends Enum> extends State<GenericDropdown<T>> {
  late GenericDropdownController<T> _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _controller = widget.controller ?? GenericDropdownController<T>();
    _controller = _controller.initialValue(widget.initialValue);
  }

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: color, width: 2),
    );
  }

  Widget? _renderSuffixText(bool isDarkMode) {
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

  String? _validatorFunction(T? value) {
    if (!widget.isRequired) return null;
    if (widget.validator != null) {
      return widget.validator!(value);
    }
    if (value == null) {
      return "Required *";
    }
    return null;
  }

  void _changeValue(T? value) {
    _controller.selectedValue = value;
    widget.onChanged?.call(value);
  }

  void _handleOnTap() async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (_controller.selectedValue == null) {
      _focusNode.unfocus();
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = TDeviceUtils.isDarkMode();
    final Color primaryColor =
        isDarkMode ? TColors.primaryDark : TColors.primary;

    return Expanded(
      child: Padding(
        padding: widget.padding,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) => DropdownButtonFormField<T>(
            onTap: _handleOnTap,
            value: _controller.selectedValue,
            isExpanded: true,
            validator: _validatorFunction,
            decoration: InputDecoration(
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
              suffix: _renderSuffixText(isDarkMode),
            ),
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16,
              color: isDarkMode ? TColors.textLight : TColors.textDark,
            ),
            onChanged: _changeValue,
            items: widget.options.map((T value) {
              return DropdownMenuItem<T>(
                value: value,
                child: Text(
                  TStringHelpers.camelCaseToWords(value.name), // ✅ use enum.name for display
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
