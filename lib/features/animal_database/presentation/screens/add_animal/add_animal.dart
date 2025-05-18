import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/constants/text_strings.dart';
import 'package:mobile_app_template/core/enums/animal_sex.dart';
import 'package:mobile_app_template/core/enums/animal_species.dart';
import 'package:mobile_app_template/core/enums/animal_status.dart';
import 'package:mobile_app_template/core/widgets/buttons/form_button/form_button.dart';
import 'package:mobile_app_template/core/widgets/containers/generic_expansion_tile.dart';
import 'package:mobile_app_template/core/widgets/dropdowns/generic_dropdown.dart';
import 'package:mobile_app_template/core/widgets/navigation/generic_appbar.dart';
import 'package:mobile_app_template/core/widgets/pickers/img_pickers/generic_img_picker.dart';
import 'package:mobile_app_template/core/widgets/text_fields/modal_input_list/modals/medication_modal.dart';
import 'package:mobile_app_template/core/widgets/text_fields/modal_input_list/modals/vaccination_modal.dart';
import 'package:mobile_app_template/core/widgets/text_fields/multivalue_text_input/multivalue_textinput.dart';
import 'package:mobile_app_template/core/widgets/text_fields/generic_text_field/generic_textfield_builder.dart';
import 'package:mobile_app_template/core/widgets/text_fields/modal_input_list/modal_input_list.dart';
import 'package:mobile_app_template/core/widgets/ui_utils/fixed_seperator.dart';
import 'package:mobile_app_template/features/animal_database/controllers/add_animal_controller.dart';
import 'package:mobile_app_template/services/navigation_service.dart';

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

  @override
  Widget build(BuildContext context) {
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
              ),
              GenericExpansionTile(
                title: TText.basicInformation,
                children: [
                  Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GenericTextfieldBuilder
                            .formField(label: TText.name)
                            .required()
                            .build()
                          ,
                          GenericTextfieldBuilder
                            .formField(label: TText.location)
                            .required()
                            .build()
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GenericTextfieldBuilder
                            .formField(label: TText.age)
                            .suffixString(TText.month)
                            .required()
                            .keyboardType(const TextInputType.numberWithOptions())
                            .build(),

                          GenericDropdown(
                            options: _generateSexList(), 
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
                            labelText: TText.species,
                            isRequired: true,
                          ),
                          GenericDropdown(
                            options: _generateStatusList(), 
                            labelText: TText.status,
                            isRequired: true,
                          ),
                        ],
                      ),
                    ],
                    ),
                  )
                ],
              ),
              GenericExpansionTile(
                title: "Coat Color",
                children: [
                  MultivalueTextInput(controller: controller.coatColorController,)
                ],
              ),
              GenericExpansionTile(
                title: "Notes",
                children: [
                  MultivalueTextInput(controller: controller.notesController)
                ],
              ),
              GenericExpansionTile(
                title: "Traits and Personality",
                children: [
                  MultivalueTextInput(controller: controller.traitsController)
                ],
              ),
              ModalInputList(
                modal: VaccinationModal(),
                title: "Vaccination Record",
                controller: controller.vaxController,
                icon: Icons.vaccines,
              ),
              ModalInputList(
                title: "Medication Record",
                modal: MedicationModal(),
                controller: controller.medController,
                icon: Icons.medication,
              ),
              const FixedSeparator(space: TSizes.spaceBetweenItems),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FormButton(
                    onPressed: _handleCancel, 
                    type: FormButtonType.cancel,
                    child: const Text("Cancel"),
                  ),
                  FormButton(
                    onPressed: _handleSave, 
                    child: const Text("Save")
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


