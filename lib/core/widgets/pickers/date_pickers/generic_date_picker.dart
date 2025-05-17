import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/utils/device/device_utility.dart';
import 'package:intl/intl.dart';

class GenericDatePickerButton extends StatefulWidget {
  const GenericDatePickerButton({
    super.key,
    required this.labelText,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.onDateSelected,
    this.errorText,
    this.padding = const EdgeInsets.all(8.0),
    this.suffixText,
  });

  final String labelText;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final Function(DateTime?)? onDateSelected;
  final String? errorText;
  final EdgeInsetsGeometry padding;
  final String? suffixText;

  @override
  State<GenericDatePickerButton> createState() => _GenericDatePickerButtonState();
}

class _GenericDatePickerButtonState extends State<GenericDatePickerButton> {
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
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

  Future<void> _pickDate(BuildContext context) async {
    final now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? now,
      firstDate: widget.firstDate ?? DateTime(now.year - 5),
      lastDate: widget.lastDate ?? DateTime(now.year + 5),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
      if (widget.onDateSelected != null) widget.onDateSelected!(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = TDeviceUtils.isDarkMode();
    final primaryColor = isDarkMode ? TColors.primaryDark : TColors.primary;

    final formattedDate = _selectedDate != null
        ? DateFormat.yMMMd().format(_selectedDate!)
        : '';

    return Expanded(
      child: Padding(
        padding: widget.padding,
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: _selectedDate != null? widget.labelText: null,
            errorText: widget.errorText,
            enabledBorder: _buildBorder(Colors.grey.shade400),
            focusedBorder: _buildBorder(primaryColor),
            errorBorder: _buildBorder(TColors.error),
            focusedErrorBorder: _buildBorder(TColors.warning),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
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
          child: InkWell(
            onTap: () => _pickDate(context),
            child: Text(
              formattedDate.isNotEmpty ? formattedDate : 'Select a date',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: formattedDate.isNotEmpty
                        ? (isDarkMode ? TColors.textLight : TColors.textDark)
                        : Colors.grey,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
