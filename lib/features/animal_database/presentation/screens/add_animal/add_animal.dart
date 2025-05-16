import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/constants/text_strings.dart';
import 'package:mobile_app_template/core/enums/animal_sex.dart';
import 'package:mobile_app_template/core/enums/animal_species.dart';
import 'package:mobile_app_template/core/enums/animal_status.dart';
import 'package:mobile_app_template/core/widgets/containers/generic_expansion_tile.dart';
import 'package:mobile_app_template/core/widgets/dropdowns/generic_dropdown.dart';
import 'package:mobile_app_template/core/widgets/navigation/generic_appbar.dart';
import 'package:mobile_app_template/core/widgets/pickers/img_pickers/generic_img_picker.dart';
import 'package:mobile_app_template/core/widgets/text_fields/chip_text_input/chip_input.dart';
import 'package:mobile_app_template/core/widgets/text_fields/generic_text_field/generic_textfield_builder.dart';
import 'package:mobile_app_template/features/animal_database/controllers/add_animal_controller.dart';

class AddAnimalScreeen extends StatelessWidget {
  const AddAnimalScreeen({super.key});

  List<String> _generateSpeciesList (){
    return AnimalSpecies.values.map((e)=>e.label).toList();
  }

  List<String> _generateStatusList () {
    return AnimalStatus.values.map((e) => e.label).toList();
  }

  List<String> _generateSexList () {
    return AnimalSex.values.map((e)=> e.label).toList();
  }
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddAnimalController>();
    return Scaffold(
      appBar:const GenericAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.symmetric(horizontal: TSizes.defaultScreenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const GenericImagePicker(),
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

                          GenericDropdown(options: _generateSexList(), labelText: TText.sex,)
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GenericDropdown(options: _generateSpeciesList(), labelText: TText.species),
                          GenericDropdown(options: _generateStatusList(), labelText: TText.status),
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
                  ChipInput()
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: controller.handleSubmit, child: const Icon(Iconsax.check),),
    );
  }
}


