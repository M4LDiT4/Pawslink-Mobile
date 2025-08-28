import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/constants/text_strings.dart';
import 'package:mobile_app_template/core/enums/animal_sex.dart';
import 'package:mobile_app_template/core/enums/animal_species.dart';
import 'package:mobile_app_template/core/enums/animal_status.dart';
import 'package:mobile_app_template/core/widgets/buttons/secondary_elevated_button.dart';
import 'package:mobile_app_template/core/widgets/composite/record_list_field/forms/animal_medication_form.dart';
import 'package:mobile_app_template/core/widgets/composite/record_list_field/forms/animal_vaccination_form.dart';
import 'package:mobile_app_template/core/widgets/composite/record_list_field/record_list_field.dart';
import 'package:mobile_app_template/core/widgets/dropdowns/generic_dropdown.dart';
import 'package:mobile_app_template/core/widgets/pickers/date_pickers/generic_date_picker.dart';
import 'package:mobile_app_template/core/widgets/pickers/img_pickers/generic_img_picker.dart';
import 'package:mobile_app_template/core/widgets/text_fields/generic_text_field/generic_textfield_builder.dart';
import 'package:mobile_app_template/core/widgets/text_fields/tag_input/tag_input.dart';
import 'package:mobile_app_template/core/widgets/texts/section_title.dart';
import 'package:mobile_app_template/core/widgets/ui_utils/fixed_seperator.dart';
import 'package:mobile_app_template/features/animal_database/controllers/add_animal_controller.dart';
import 'package:mobile_app_template/navigation/navigation_service.dart';

class AddAnimalScreen extends StatelessWidget {
  final controller = Get.find<AddAnimalController>();

  AddAnimalScreen({super.key});

  // -----------------------------
  // Dropdown options
  // -----------------------------
  List<AnimalSpecies> get _speciesList => AnimalSpecies.values;
  List<AnimalStatus> get _statusList => AnimalStatus.values;
  List<AnimalSex> get _sexList => AnimalSex.values;

  // -----------------------------
  // Handlers
  // -----------------------------
  void _handleCancel() => TNavigationService.back();
  void _handleSave() => controller.handleSubmit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultScreenPadding)
            .copyWith(bottom: 40, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildImagePicker(),
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

  // -----------------------------
  // AppBar
  // -----------------------------
  AppBar _buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: _handleCancel,
      ),
      title: Text(controller.prevAnimal == null ? 'Add Animal' : 'Edit Animal'),
      centerTitle: true,
      actions: [_buildSaveToLocalMenu()],
      backgroundColor: const Color(0xFFDB7093),
      elevation: 4,
    );
  }

  Widget _buildSaveToLocalMenu() {
    if(controller.prevAnimal != null){
      return IconButton(onPressed: (){}, icon: const Icon(Iconsax.trash));
    }

    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert),
      itemBuilder: (_) => [
        PopupMenuItem<String>(
          value: 'save-locally',
          child: Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Switch(
                    value: controller.saveToLocal.value,
                    onChanged: controller.saveToLocal,
                  ),
                  const Text('Save to Local'),
                ],
              )),
        ),
      ],
    );
  }

  // -----------------------------
  // Image Picker
  // -----------------------------
  Widget _buildImagePicker() {
    return GenericImagePicker(
      key: controller.imgPickerKey,
      controller: controller.imgPickerController,
      isRequired: true,
    );
  }

  // -----------------------------
  // Basic Info Form
  // -----------------------------
  Widget _buildBasicInfoForm() {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          _buildTextFieldRow([
            GenericTextfieldBuilder.formField(label: TText.name)
                .controller(controller.nameController)
                .required()
                .build(),
            GenericTextfieldBuilder.formField(label: TText.location)
                .controller(controller.locationController)
                .required()
                .build(),
          ]),
          _buildTextFieldRow([
            GenericTextfieldBuilder.formField(label: TText.age)
                .controller(controller.ageController)
                .suffixString(TText.month)
                .required()
                .keyboardType(const TextInputType.numberWithOptions())
                .build(),
            GenericDropdown<AnimalSex>(
              options: _sexList,
              controller: controller.sexController,
              labelText: TText.sex,
              isRequired: true,
            ),
          ]),
          _buildTextFieldRow([
            GenericDropdown<AnimalSpecies>(
              options: _speciesList,
              controller: controller.speciesController,
              labelText: TText.species,
              isRequired: true,
            ),
            GenericDropdown<AnimalStatus>(
              options: _statusList,
              controller: controller.statusController,
              labelText: TText.status,
              isRequired: true,
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildTextFieldRow(List<Widget> fields) {
    return Row(
      children: fields
    );
  }

  // -----------------------------
  // Sterilization
  // -----------------------------
  Widget _buildSterilizationSection() {
    return Obx(() => Row(
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
        ));
  }

  // -----------------------------
  // Tags Section
  // -----------------------------
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

  // -----------------------------
  // Records Section
  // -----------------------------
  Widget _buildRecordsSection() {
    return Column(
      children: [
        RecordListField(
          controller: controller.vaccinationController,
          form: const AnimalVaccinationForm(title: "Vaccination Details"),
          title: "Vaccination History",
        ),
        const FixedSeparator(space: TSizes.spaceBetweenSections),
        RecordListField(
          controller: controller.medicationController,
          form: const AnimalMedicationForm(title: "Medication Details"),
          title: "Medication History",
        ),
      ],
    );
  }

  // -----------------------------
  // Action Buttons
  // -----------------------------
  Widget _buildActionButtons() {
    return Column(
      children: [
        Obx(() => Text(
              "**${controller.saveToLocal.value ? "Animal will be saved as a draft" : "Animal will be saved to the cloud"}**",
              style: const TextStyle(fontWeight: FontWeight.bold),
            )),
        const FixedSeparator(space: TSizes.spaceBetweenItems),
        Row(
          children: [
            Expanded(
              child: SecondaryElevatedButton(
                onPressed: _handleCancel,
                child: const Text("Cancel"),
              ),
            ),
            const SizedBox(width: TSizes.spaceBetweenItems),
            Expanded(
              child: ElevatedButton(
                onPressed: _handleSave,
                child: const Text("Save"),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // -----------------------------
  // Generic Section Builder
  // -----------------------------
  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: title),
        ...children,
      ],
    );
  }
}
