import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/constants/text_strings.dart';
import 'package:mobile_app_template/core/enums/animal_sex.dart';
import 'package:mobile_app_template/core/enums/animal_species.dart';
import 'package:mobile_app_template/core/enums/animal_status.dart';
import 'package:mobile_app_template/core/widgets/buttons/form_button/form_button.dart';
import 'package:mobile_app_template/core/widgets/buttons/secondary_elevated_button.dart';
import 'package:mobile_app_template/core/widgets/composite/record_list_field/forms/animal_medication_form.dart';
import 'package:mobile_app_template/core/widgets/composite/record_list_field/forms/animal_vaccination_form.dart';
import 'package:mobile_app_template/core/widgets/composite/record_list_field/record_list_field.dart';
import 'package:mobile_app_template/core/widgets/dropdowns/generic_dropdown.dart';
import 'package:mobile_app_template/core/widgets/navigation/generic_appbar.dart';
import 'package:mobile_app_template/core/widgets/pickers/date_pickers/generic_date_picker.dart';
import 'package:mobile_app_template/core/widgets/pickers/img_pickers/generic_img_picker.dart';
import 'package:mobile_app_template/core/widgets/text_fields/generic_text_field/generic_textfield_builder.dart';
import 'package:mobile_app_template/core/widgets/text_fields/tag_input/tag_input.dart';
import 'package:mobile_app_template/core/widgets/texts/section_title.dart';
import 'package:mobile_app_template/core/widgets/ui_utils/fixed_seperator.dart';
import 'package:mobile_app_template/features/animal_database/controllers/add_animal_controller.dart';
import 'package:mobile_app_template/navigation/navigation_service.dart';

class AddAnimalScreeen extends StatelessWidget {
  final controller = Get.find<AddAnimalController>();

  AddAnimalScreeen({super.key});

  // Helpers for dropdowns
  List<AnimalSpecies> _speciesList() => AnimalSpecies.values.map((e) => e).toList();
  List<AnimalStatus> _statusList() => AnimalStatus.values.map((e) => e).toList();
  List<AnimalSex> _sexList() => AnimalSex.values.map((e) => e).toList();

  void _handleCancel() => TNavigationService.back();
  void _handleSave() async{
    controller.handleSubmit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GenericAppbar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: TSizes.defaultScreenPadding,
          right: TSizes.defaultScreenPadding,
          bottom: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GenericImagePicker(
              key: controller.imgPickerKey,
              controller: controller.imgPickerController,
              isRequired: true,
            ),
            const FixedSeparator(space: TSizes.spaceBetweenSections),
            _buildSection(TText.basicInformation, [_buildBasicInfoForm()]),
            const FixedSeparator(space: TSizes.spaceBetweenSections),
            _buildSterilizationSection(),
            const FixedSeparator(space: TSizes.spaceBetweenSections),
            _buildTagsSection(),
            const FixedSeparator(space: TSizes.spaceBetweenSections),
            _buildRecordsSection(),
            const FixedSeparator(space: TSizes.spaceBetweenSections),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: title),
        ...children,
      ],
    );
  }

  Widget _buildBasicInfoForm() {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          Row(
            children: [
              GenericTextfieldBuilder.formField(label: TText.name)
                  .controller(controller.nameController)
                  .required()
                  .build(),
              GenericTextfieldBuilder.formField(label: TText.location)
                  .controller(controller.locationController)
                  .required()
                  .build(),
            ],
          ),
          Row(
            children: [
              GenericTextfieldBuilder.formField(label: TText.age)
                  .controller(controller.ageController)
                  .suffixString(TText.month)
                  .required()
                  .keyboardType(const TextInputType.numberWithOptions())
                  .build(),
              GenericDropdown<AnimalSex>(
                options: _sexList(),
                controller: controller.sexController,
                labelText: TText.sex,
                isRequired: true,
              ),
            ],
          ),
          Row(
            children: [
              GenericDropdown<AnimalSpecies>(
                options: _speciesList(),
                controller: controller.speciesController,
                labelText: TText.species,
                isRequired: true,
              ),
              GenericDropdown<AnimalStatus>(
                options: _statusList(),
                controller: controller.statusController,
                labelText: TText.status,
                isRequired: true,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSterilizationSection() {
    return Obx(
      () => Row(
        children: [
          const Text("Neutered/Spayed?"),
          Checkbox(
            value: controller.isSterilized,
            onChanged: controller.setIsSterilized,
          ),
          GenericDatePickerButton(
            key: controller.sterilizationKey,
            labelText: "Pick Date",
            enabled: controller.isSterilized,
            controller: controller.sterilizationDateController,
            isRequired: controller.isSterilized,
          ),
        ],
      ),
    );
  }

  Widget _buildTagsSection() {
    return Column(
      children: [
        TagInput(title: "Coat color", controller: controller.coatController),
        const FixedSeparator(space: TSizes.spaceBetweenSections),
        TagInput(title: "Traits and Personality", controller: controller.traitsController),
        const FixedSeparator(space: TSizes.spaceBetweenSections),
        TagInput(title: "Notes", controller: controller.notesController),
      ],
    );
  }

  Widget _buildRecordsSection() {
    return const Column(
      children:  [
        RecordListField(
          form: AnimalVaccinationForm(title: "Vaccination Details"),
          title: "Vaccination History",
        ),
        FixedSeparator(space: TSizes.spaceBetweenSections),
        RecordListField(
          form: AnimalMedicationForm(title: "Medication Details"),
          title: "Medication History",
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        const FixedSeparator(space: TSizes.spaceBetweenSections),
        Row(
          children: [
            Expanded(
              child: SecondaryElevatedButton(
                onPressed: _handleCancel, 
                child: const Text("Cancel")
              )
            ),
          ],
        ),
        const FixedSeparator(space: TSizes.spaceBetweenItems),
        Row(
          children: [
            Expanded(
              child:ElevatedButton(
                onPressed: _handleSave, 
                child: const Text('Save')
              )
            )
        ],)
      ],
    );
  }

}
