import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/utils/device/device_utility.dart';
import 'package:intl/intl.dart';
import 'package:mobile_app_template/core/widgets/pickers/date_pickers/generic_datepicker_controller.dart';

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
    this.controller,
    this.isRequired = false,
  });

  final String labelText;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final Function(DateTime?)? onDateSelected;
  final String? errorText;
  final EdgeInsetsGeometry padding;
  final String? suffixText;
  final GenericDatepickerController? controller;
  final bool isRequired;

  @override
  State<GenericDatePickerButton> createState() => _GenericDatePickerButtonState();
}

class _GenericDatePickerButtonState extends State<GenericDatePickerButton> {
  late final GenericDatepickerController _controller;
  bool _expanded = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? GenericDatepickerController();
    _controller.initialDate(widget.initialDate);
    _controller.errorText(widget.errorText);
    _controller.isRequired(widget.isRequired);
    _expanded = _controller.selectedDate != null;
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
      initialDate: _controller.selectedDate,
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
        _controller.selectedDate = picked;
        _expanded = true;
      });
      if (widget.onDateSelected != null) {
        widget.onDateSelected!(picked);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = TDeviceUtils.isDarkMode();
    final primaryColor = isDarkMode ? TColors.primaryDark : TColors.primary;

    return Expanded(
      child: Padding(
        padding: widget.padding,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            final date = _controller.selectedDate;
            final formattedDate = date != null ? DateFormat.yMMMd().format(date) : '';
            final hasDate = date != null;

            return AnimatedSize(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InputDecorator(
                    decoration: InputDecoration(
                      labelText: hasDate ? widget.labelText : null,
                      errorText: _controller.getErrorMessage(),
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
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 400),
                        opacity: formattedDate.isNotEmpty ? 1 : 0.5,
                        child: Text(
                          formattedDate.isNotEmpty ? formattedDate : 'Select a date',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: isDarkMode ? TColors.textLight : TColors.textDark,
                              ),
                        ),
                      ),
                    ),
                  ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    child: _expanded
                        ? const SizedBox(height: 10)
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
