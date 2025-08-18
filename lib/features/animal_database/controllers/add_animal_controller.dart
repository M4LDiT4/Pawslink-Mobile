

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_template/core/widgets/composite/record_list_field/record_list_field.dart';
import 'package:mobile_app_template/core/widgets/composite/record_list_field/record_list_field_controller.dart';
import 'package:mobile_app_template/core/widgets/dropdowns/generic_dropdown_controller.dart';
import 'package:mobile_app_template/core/widgets/pickers/date_pickers/generic_datepicker_controller.dart';
import 'package:mobile_app_template/core/widgets/pickers/img_pickers/generic_img_picker_controller.dart';
import 'package:mobile_app_template/core/widgets/text_fields/tag_input/tag_input_controller.dart';
import 'package:mobile_app_template/domain/entities/animal_dto.dart';

class AddAnimalController extends GetxController {
  AnimalDTO? prevAnimal;

  late GlobalKey<FormState> formKey;

  //image picker controller
  late GenericImgPickerController imgPickerController;

  //form controllers;
  late TextEditingController nameController;
  late TextEditingController locationController;
  late TextEditingController ageController;
  late GenericDropdownController sexController;
  late GenericDropdownController speciesController;
  late GenericDropdownController statusController;
  late GenericDatepickerController sterilizationDateController;


  //
  late TagInputController coatController;
  late TagInputController traitsController;
  late TagInputController notesController;

  late RecordListFieldController vaccinationController;

  final RxBool _isSterilized = false.obs;

  AddAnimalController({
    this.prevAnimal
  });

  @override
  void onInit(){
    super.onInit();
    if(prevAnimal != null){
      _initWithData();
    }else{
      _initWithNoData();
    }
  }

  @override
  void onClose(){
    nameController.dispose();
    locationController.dispose();
    ageController.dispose();
    sexController.dispose();
    speciesController.dispose();
    statusController.dispose();
    coatController.dispose();
    traitsController.dispose();
    notesController.dispose();
    vaccinationController.dispose();
    super.onClose();
  }

  void _initWithNoData(){
    nameController = TextEditingController();
    locationController = TextEditingController();
    ageController = TextEditingController();
    sexController = GenericDropdownController();
    speciesController = GenericDropdownController();
    statusController = GenericDropdownController();
    imgPickerController = GenericImgPickerController();
    formKey = GlobalKey<FormState>();
    sterilizationDateController = GenericDatepickerController();
    coatController = TagInputController();
    traitsController = TagInputController();
    notesController = TagInputController();
    vaccinationController = RecordListFieldController();
  }

  void _initWithData(){
    final prevData = prevAnimal!;
    nameController = TextEditingController(
      text: prevData.name
    );
    locationController = TextEditingController(
      text: prevData.location
    );
    ageController = TextEditingController(
      text: prevData.age?.toString()
    );
    sexController = GenericDropdownController(
      selectedValue: prevData.sex.name
    );
    speciesController = GenericDropdownController(
      selectedValue: prevData.species.name
    );
    statusController = GenericDropdownController(
      selectedValue: prevData.status.name
    );
    imgPickerController = GenericImgPickerController(
    );
    formKey = GlobalKey<FormState>();
    sterilizationDateController = GenericDatepickerController();
    coatController = TagInputController();
    traitsController = TagInputController();
    notesController = TagInputController();
    vaccinationController = RecordListFieldController();
  }

  void handleSubmit(){
    // bool isFormValid = formKey.currentState!.validate();
    // bool isImageValid = imgPickerController.validate();
    // bool isSterilizationValid = sterilizationDateController.validate();
    // if(isFormValid && isImageValid && isSterilizationValid){
    //   final params = AddAnimalSummaryParams(
    //     name: nameController.text , 
    //     age: ageController.text, 
    //     location: locationController.text, 
    //     sex: sexController.selectedValue!, 
    //     species: speciesController.selectedValue!, 
    //     status: statusController.selectedValue!,
    //     coatColor: coatColorController.getStringValues(),
    //     notes: notesController.getStringValues(),
    //     traits: traitsController.getStringValues(),
    //     vaccinations: vaxController.getValue(),
    //     medications: medController.getValue(),
    //     animalImage: imgPickerController.selectedImage,
    //     sterilizationDate: _isSterilized.value? sterilizationDateController.selectedDate : null,
    //   );
    //   TNavigationService.toNamed(TAppRoutes.addAnimalSummary, arguments: params);
    // }
  }

  bool get isSterilized => _isSterilized.value;

  void setIsSterilized(bool? value){
    if(value == null) return;
    _isSterilized.value = value;
  }
}