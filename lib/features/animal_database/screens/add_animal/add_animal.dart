import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/constants/text_strings.dart';
import 'package:mobile_app_template/core/enums/animal_sex.dart';
import 'package:mobile_app_template/core/enums/animal_species.dart';
import 'package:mobile_app_template/core/enums/animal_status.dart';
import 'package:mobile_app_template/core/utils/device/device_utility.dart';
import 'package:mobile_app_template/core/widgets/buttons/form_button/form_button.dart';
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
import 'package:mobile_app_template/services/navigation/navigation_service.dart';

class AddAnimalScreeen extends StatelessWidget {
  final controller = Get.find<AddAnimalController>();
  AddAnimalScreeen({super.key});

  List<String> _generateSpeciesList (){
    return AnimalSpecies.values.map((e)=>e.label).toList();
  }

  List<String> _generateStatusList () {
    return AnimalStatus.values.map((e) => e.label).toList();
  }

  List<String> _generateSexList () {
    return AnimalSex.values.map((e)=> e.label).toList();
  }

  void _handleCancel(){
    TNavigationService.back();
  }

  void _handleSave(){
    controller.handleSubmit();
  }

  Widget _buildSection(bool isDarkMode, List<Widget> children, String title, BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SectionTitle(title: title),
        ...children,
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = TDeviceUtils.isDarkMode();
    return Scaffold( 
      appBar:const GenericAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.only(
            left: TSizes.defaultScreenPadding,
            right: TSizes.defaultScreenPadding,
            bottom: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GenericImagePicker(
                controller: controller.imgPickerController,
                isRequired: true,
                key: controller.imgPickerKey,
              ),
              const FixedSeparator(space: TSizes.spaceBetweenSections),
              _buildSection(
                isDarkMode, 
                [
                  Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GenericTextfieldBuilder
                            .formField(label: TText.name)
                            .controller(controller.nameController)
                            .required()
                            .build()
                          ,
                          GenericTextfieldBuilder
                            .formField(label: TText.location)
                            .controller(controller.locationController)
                            .required()
                            .build()
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GenericTextfieldBuilder
                            .formField(label: TText.age)
                            .controller(controller.ageController)
                            .suffixString(TText.month)
                            .required()
                            .keyboardType(const TextInputType.numberWithOptions())
                            .build(),

                          GenericDropdown(
                            options: _generateSexList(), 
                            controller: controller.sexController,
                            labelText: TText.sex,
                            isRequired: true,
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GenericDropdown(
                            options: _generateSpeciesList(),
                            controller: controller.speciesController, 
                            labelText: TText.species,
                            isRequired: true,
                          ),
                          GenericDropdown(
                            options: _generateStatusList(), 
                            controller: controller.statusController,
                            labelText: TText.status,
                            isRequired: true,
                          ),
                        ],
                      ),
                    ],
                    ),
                  ),
                ], 
                TText.basicInformation, 
                context
              ),
              const FixedSeparator(space: TSizes.spaceBetweenSections),
                Obx(()=> Row(
                  children: [
                    const Text("Neutered/Spayed?"),
                    Checkbox(
                      value: controller.isSterilized, 
                      onChanged: controller.setIsSterilized
                    ),
                    GenericDatePickerButton(
                      key: controller.sterilizationKey,
                      labelText: "Pick Date",
                      enabled: controller.isSterilized,
                      controller: controller.sterilizationDateController,
                      isRequired: controller.isSterilized,
                    )
                  ],
                )
              ),
              const FixedSeparator(space: TSizes.spaceBetweenSections),
              TagInput(
                title: "Coat color",
                controller: controller.coatController,
              ),
              const FixedSeparator(space: TSizes.spaceBetweenSections),
              TagInput(
                title: "Traits and Personality",
                controller: controller.traitsController,
              ),
              const FixedSeparator(space: TSizes.spaceBetweenSections),
              TagInput(
                title: "Notes",
                controller: controller.notesController,
                ),
              const FixedSeparator(space: TSizes.spaceBetweenSections),
              const RecordListField(
                form: AnimalVaccinationForm(title: "Vaccination Details"), 
                title: "Vaccination History",
              ),
              const FixedSeparator(space: TSizes.spaceBetweenSections),
              const RecordListField(
                form: AnimalMedicationForm(title: "Medication Details"), 
                title: "Medication History"
              ),
              const FixedSeparator(space: TSizes.spaceBetweenSections),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FormButton(
                    onPressed: _handleCancel, 
                    type: FormButtonType.cancel,
                    child: const Text(TText.cancel),
                  ),
                  FormButton(
                    onPressed: _handleSave, 
                    child: const Text(TText.save)
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


