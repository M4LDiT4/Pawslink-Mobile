import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/utils/device/device_utility.dart';

class GenericDropdown extends StatefulWidget {
  const GenericDropdown({
    super.key,
    this.selectedValue,
    required this.options,
    required this.labelText,
    this.errorText,
    this.onChanged,
    this.padding = const EdgeInsets.all(8.0),
    this.suffixText,
  });

  final String? selectedValue;
  final List<String> options;
  final String labelText;
  final String? errorText;
  final Function(String?)? onChanged;
  final EdgeInsetsGeometry padding;
  final String? suffixText;

  @override
  State<GenericDropdown> createState() => _GenericDropdownState();
}

class _GenericDropdownState extends State<GenericDropdown> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.selectedValue;
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

  @override
  Widget build(BuildContext context) {
    final isDarkMode = TDeviceUtils.isDarkMode();
    final Color primaryColor = isDarkMode ? TColors.primaryDark : TColors.primary;

    return Expanded(
      child: Padding(
        padding: widget.padding,
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: widget.labelText,
            errorText: widget.errorText,
            enabledBorder: _buildBorder(Colors.grey.shade400),
            focusedBorder: _buildBorder(primaryColor),
            errorBorder: _buildBorder(TColors.error),
            focusedErrorBorder: _buildBorder(TColors.warning),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
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
          isEmpty: selectedValue == null,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedValue,
              isExpanded: true,
              style: TextStyle(
                fontWeight: FontWeight.normal, // Remove bold for selected value
                fontSize: 16,
                color: isDarkMode ? TColors.textLight : TColors.textDark,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue;
                });
                if (widget.onChanged != null) widget.onChanged!(newValue);
              },
              items: widget.options.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: Theme.of(context).textTheme.bodyLarge
                  ),
                );
              }).toList(),
            ),
          ),

        ),
      ),
    );
  }
}
