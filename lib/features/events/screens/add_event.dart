
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/widgets/buttons/form_button/form_button.dart';
import 'package:mobile_app_template/core/widgets/dialogs/animated_dialog.dart';
import 'package:mobile_app_template/core/widgets/dialogs/loading_dialog/loading_dialog.dart';

import 'package:mobile_app_template/core/widgets/navigation/generic_appbar.dart';
import 'package:mobile_app_template/core/widgets/pickers/date_pickers/generic_date_picker.dart';
import 'package:mobile_app_template/core/widgets/pickers/img_pickers/generic_img_picker.dart';
import 'package:mobile_app_template/core/widgets/pickers/time_pickers/generic_time_picker.dart';
import 'package:mobile_app_template/core/widgets/text_fields/generic_text_field/generic_textfield_builder.dart';
import 'package:mobile_app_template/core/widgets/texts/section_title.dart';
import 'package:mobile_app_template/core/widgets/ui_utils/fixed_seperator.dart';
import 'package:mobile_app_template/features/events/controllers/add_event_controller.dart';

class AddEventScreen extends StatelessWidget {
  final _controller = Get.find<Addeventcontroller>();
  AddEventScreen({super.key});

  void _handleOnSave(BuildContext context){
    AnimatedDialog.show(
      context, 
      child: Text("text")
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //Dismiss the keyboard when you tap outside
        //necessary for screens with multilined text input widgets
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: const GenericAppbar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultScreenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GenericImagePicker(),
                const FixedSeparator(space: TSizes.spaceBetweenSections),
                const SectionTitle(title: "Event Details"),
                Form(
                  key: _controller.key,
                  child: Column(
                  children: [
                    Row(
                      children: [
                        GenericTextfieldBuilder
                        .formField(label: "Event name")
                        .required()
                        .controller(_controller.titleController)
                        .build()
                      ],
                    ),
                    Row(
                      children: [
                        GenericTextfieldBuilder
                        .formField(label: "Location")
                        .controller(_controller.locationController)
                        .required()
                        .build()
                      ],
                    ),
                    Row(
                      children: [
                        GenericDatePickerButton(
                          labelText: "Event Date",
                          isRequired: true,
                          controller: _controller.dateController,
                        ),
                        GenericTimePicker(
                          labelText: "Time",
                          controller: _controller.timeController,
                          isRequired: true,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GenericTextfieldBuilder()
                        .maxLines(null)
                        .label("Description")
                        .keyboardType(TextInputType.multiline)
                        .controller(_controller.descriptionController)
                        .required()
                        .build()
                      ],
                    ),
                  ],
                )
                ),
                const FixedSeparator(space: TSizes.spaceBetweenSections),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FormButton(
                      onPressed: (){}, 
                      type: FormButtonType.cancel,
                      child: const Text("cancel"),
                    ),
                    FormButton(
                      onPressed: () => _handleOnSave(context), 
                      type: FormButtonType.confirm,
                      child: const Text("save"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
} 
