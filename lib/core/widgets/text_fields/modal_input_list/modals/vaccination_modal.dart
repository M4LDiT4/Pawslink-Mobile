import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/widgets/dialogs/animated_dialog.dart';
import 'package:mobile_app_template/core/widgets/pickers/date_pickers/generic_date_picker.dart';
import 'package:mobile_app_template/core/widgets/text_fields/generic_text_field/generic_textfield_builder.dart';
import 'package:mobile_app_template/core/widgets/text_fields/modal_input_list/modals/input_modal_strategy.dart';

class VaccinationModal extends InputModalStrategy {
  VaccinationModal({required String label}) : super(label: label);

  @override
  InputModalStrategy setCallback(VoidCallback callback) {
    this.callback = callback;
    return this;
  }

  @override
  void show(BuildContext context) {
    AnimatedDialog.show(
      context, label: label, 
      child: build(context)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            GenericTextfieldBuilder.formField(label: label).build(),
          ],
        ),
        const Row(
          children: [
             GenericDatePickerButton(labelText: "Vaccination Date"),
          ],
        ),
        Row(
          children: [
            ElevatedButton(onPressed: (){}, child: Text("Cancel")),
            ElevatedButton(onPressed: (){}, child: Text("OK"))
          ],
        )
      ],
    ));
  }
}
