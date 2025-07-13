import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/widgets/pickers/time_pickers/generic_time_picker_controller.dart';

class GenericTimePicker extends StatefulWidget {
  final GenericTimePickerController? controller;
  final EdgeInsetsGeometry padding;
  final String labelText;
  final TimeOfDay? initialTime;
  final String? errorText;
  final bool isRequired;
  const GenericTimePicker({
    super.key,
    this.controller,
    this.padding = const EdgeInsets.all(8.0),
    required this.labelText,
    this.isRequired =false,
    this.initialTime,
    this.errorText,
  });

  @override
  State<GenericTimePicker> createState() => _GenericTimePickerState();
}

class _GenericTimePickerState extends State<GenericTimePicker> {
  late final GenericTimePickerController _controller;

  @override
  void initState(){
    super.initState();
    _controller = widget.controller ?? 
    GenericTimePickerController()
      ..initialtime(widget.initialTime)
      ..isRequired(widget.isRequired)
      ..customErrorMssg(widget.errorText);
  }

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: color, width: 2),
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _controller.selectedTime ?? widget.initialTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      _controller.selectedTime = picked;
      _controller.validate();
      setState(() {
        _controller.selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.primary;
    return Expanded(
      child: Padding(
        padding: widget.padding,
        child: AnimatedBuilder(
          animation: _controller, 
          builder: (context, _){
            TimeOfDay? selectedTime = _controller.selectedTime;
            String formattedTime = selectedTime != null 
              ? selectedTime.format(context) 
              : '';
            bool hasTime = selectedTime != null;
            return AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InputDecorator(
                    decoration: InputDecoration(
                      labelText: hasTime? widget.labelText: '',
                      errorText: _controller.errorMessage,
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
                    ),
                    child: InkWell(
                      onTap: ()=>_selectTime(context),
                      child: AnimatedOpacity(
                        opacity: formattedTime.isNotEmpty ? 1 : 0.6, 
                        duration: const Duration(milliseconds: 300),
                        child: Text(
                          formattedTime.isNotEmpty ? formattedTime : 'Select Time',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        )
      )
    );
  }
}