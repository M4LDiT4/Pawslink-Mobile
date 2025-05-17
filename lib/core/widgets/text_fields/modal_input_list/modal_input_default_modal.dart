
import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/widgets/pickers/date_pickers/generic_date_picker.dart';
import 'package:mobile_app_template/core/widgets/text_fields/generic_text_field/generic_textfield_builder.dart';
import 'package:mobile_app_template/services/navigation_service.dart';

class ModalInputDefaultModal extends StatelessWidget {
  final String label;
  const ModalInputDefaultModal({
    super.key,
    required this.label
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Form(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GenericTextfieldBuilder
              .formField(label: label)
              .build(),
            const GenericDatePickerButton(labelText: "Vaccination Date"),
            ElevatedButton(onPressed: TNavigationService.back, child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text("Back")],))
            ] ,
          )
        )
      ],
    );
  }
}