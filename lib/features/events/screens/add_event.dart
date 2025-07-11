
import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/widgets/navigation/generic_appbar.dart';
import 'package:mobile_app_template/core/widgets/pickers/date_pickers/generic_date_picker.dart';
import 'package:mobile_app_template/core/widgets/text_fields/generic_text_field/generic_textfield_builder.dart';
import 'package:mobile_app_template/core/widgets/ui_utils/fixed_seperator.dart';
import 'package:mobile_app_template/features/events/widgets/event_image_picker.dart';

class AddEventScreen extends StatelessWidget {
  const AddEventScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GenericAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultScreenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ImagePickerWidget(),
              const FixedSeparator(space: TSizes.spaceBetweenSections),
              const Text("Event information"),
              Row(
                children: [
                  GenericTextfieldBuilder
                  .formField(label: "Event name")
                  .build()
                ],
              ),
              const Row(
                children: [
                  GenericDatePickerButton(labelText: "Event Date")
                ],
              )
              //add additional texts
            ],
          ),
        ),
      ),
    );
  }
} 
