import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/constants/text_strings.dart';
import 'package:mobile_app_template/core/widgets/dropdowns/generic_dropdown.dart';
import 'package:mobile_app_template/core/widgets/navigation/generic_appbar.dart';
import 'package:mobile_app_template/core/widgets/pickers/img_pickers/generic_img_picker.dart';
import 'package:mobile_app_template/core/widgets/text_fields/generic_text_field.dart';
import 'package:mobile_app_template/features/animal_database/controllers/add_animal_controller.dart';

class AddAnimalScreeen extends StatelessWidget {
  const AddAnimalScreeen({super.key});

  void gotoCameraScreen () async{
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
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(TSizes.paddingmd),
                  child: Theme(
                    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                    child:Form(
                      key: controller.formKey,
                      child:const ExpansionTile(
                        initiallyExpanded: true,
                        title: Text(TText.basicInformation),
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GenericTextField(
                                labelText: TText.name,
                                isRequired: true,
                              ),
                              GenericTextField(
                                labelText: TText.location,
                                isRequired: true,
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GenericTextField(
                                labelText: "Age", 
                                suffixText: "months", 
                                keyboardType: TextInputType.numberWithOptions(),
                                isRequired: true,
                              ),
                              GenericDropdown(options: ["Male", "Female"], labelText: "Sex",)
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GenericDropdown(options: ["Dog", "Cat"], labelText: "Species"),
                              GenericDropdown(options: ["Rainbow bridge", "Adopted"], labelText: "Species"),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GenericTextField(labelText: "Coat Color")
                            ],
                          )
                        ],
                      )
                    )
                  ),
                )
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: controller.handleSubmit, child: const Icon(Iconsax.check),),
    );
  }
}


