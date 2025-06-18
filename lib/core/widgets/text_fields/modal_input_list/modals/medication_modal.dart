
import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/utils/formatters/formatter.dart';
import 'package:mobile_app_template/core/widgets/dialogs/animated_dialog.dart';
import 'package:mobile_app_template/core/widgets/pickers/date_pickers/generic_date_picker.dart';
import 'package:mobile_app_template/core/widgets/pickers/date_pickers/generic_datepicker_controller.dart';
import 'package:mobile_app_template/core/widgets/text_fields/generic_text_field/generic_textfield_builder.dart';
import 'package:mobile_app_template/core/widgets/text_fields/modal_input_list/modals/input_modal_strategy.dart';
import 'package:mobile_app_template/core/widgets/ui_utils/fixed_seperator.dart';
import 'package:mobile_app_template/data/model/modal_input_list_item.dart';
import 'package:mobile_app_template/services/navigation_service.dart';

class MedicationModal extends InputModalStrategy {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _datePickerController = GenericDatepickerController();
  
  MedicationModal();
 
  @override
  InputModalStrategy setCallback(void Function(ModalInputListItem item) callback){
    this.callback = callback;
    return this;
  }

  @override
  void show(BuildContext context){
    AnimatedDialog.show(
      context, 
      label: "Medication", 
      child: build(context)
    );
  }

  void handleCancel(){
    _titleController.clear();
    _datePickerController.reset();
    TNavigationService.back();
  }

  void handleSave(){
    final bool isTitleValid = _formKey.currentState!.validate();
    final bool isDateValid = _datePickerController.isValid();
    if(isTitleValid && isDateValid){
      final item = ModalInputListItem(
        title: _titleController.text, 
        subtitle: TFormatter.formatDate(_datePickerController.selectedDate),
        data: modalValueToMap()
      );
      callback!(item);
      _titleController.clear();
      TNavigationService.back();
    }
  }

  @override
  Map<String, dynamic> modalValueToMap() {
    return {
      "description": _titleController.text,
      "date": _datePickerController.selectedDate!.toIso8601String(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(children: [
          Text(
            style: Theme.of(context).textTheme.titleMedium,
            "Enter Medication Details"
            )
          ]
        ),
        const FixedSeparator(space: TSizes.spaceBetweenItems),
        Row(
          children: [
            GenericTextfieldBuilder
            .formField(label: "Medication for")
            .controller(_titleController)
            .required()
            .build(),
          ],
        ),
        Row(
          children: [
             GenericDatePickerButton(
              labelText: "Medication Date",
              controller: _datePickerController,
              isRequired: true,
              errorText: "Field cannot be empty",
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(onPressed: handleCancel, child:const Text("Cancel")),
            TextButton(onPressed: handleSave, child: const Text("Confirm"))
          ],
        )
      ],
    ));
  }

}