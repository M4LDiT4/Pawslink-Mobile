

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_template/core/utils/formatters/formatter.dart';
import 'package:mobile_app_template/core/widgets/composite/record_list_field/record_list_field_controller.dart';
import 'package:mobile_app_template/core/widgets/composite/record_list_field/record_list_item.dart';
import 'package:mobile_app_template/core/widgets/dropdowns/generic_dropdown_controller.dart';
import 'package:mobile_app_template/core/widgets/pickers/date_pickers/generic_datepicker_controller.dart';
import 'package:mobile_app_template/core/widgets/pickers/img_pickers/generic_img_picker_controller.dart';
import 'package:mobile_app_template/core/widgets/text_fields/tag_input/tag_input_controller.dart';
import 'package:mobile_app_template/domain/entities/animal_dto.dart';

class AddAnimalController extends GetxController {
  AnimalDTO? prevAnimal;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final imgPickerKey = GlobalKey();
  final sterilizationKey = GlobalKey();

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
  
  // tag input controllers
  late TagInputController coatController;
  late TagInputController traitsController;
  late TagInputController notesController;

  // form inputs
  late RecordListFieldController vaccinationController;
  late RecordListFieldController medicationController;

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
    sterilizationDateController = GenericDatepickerController();
    coatController = TagInputController();
    traitsController = TagInputController();
    notesController = TagInputController();
    vaccinationController = RecordListFieldController();
    medicationController = RecordListFieldController();
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
    sterilizationDateController = GenericDatepickerController(
      initialDate: prevData.sterilizationDate
    );
    coatController = TagInputController(
      items: prevData.coatColor
    );
    traitsController = TagInputController(
      items: prevData.traitsAndPersonality
    );
    notesController = TagInputController(
      items: prevData.notes
    );
    vaccinationController = RecordListFieldController(
      initialData: prevData.vaccinationHistory.map(
        (item)=> RecordListItem(
          title: item.vaccineName, 
          subTitle: TFormatter.formatDate(item.dateGiven), 
          data: item
        )
      ).toList()
    );
    medicationController = RecordListFieldController(
      initialData: prevData.medicationHistory.map(
        (item)=> RecordListItem(
          title: item.medicationName, 
          subTitle: TFormatter.formatDate(item.dateGiven), 
          data: item
        )
      ).toList()
    );
  }

  void handleSubmit(){
    bool isFormValid = formKey.currentState!.validate();
    bool isImageValid = imgPickerController.validate();
    bool isSterilizationValid = sterilizationDateController.validate();
    if(isFormValid
      && isImageValid
      && isSterilizationValid  
    ){
      // do something
    }else{
      if(!isImageValid){
        scrollToError(imgPickerKey);
      }else if(!isFormValid){
        scrollToError(formKey);
      }else{
        scrollToError(sterilizationKey);
      }
    }
  }

  void scrollToError(GlobalKey key){
    final context = key.currentContext;
    if(context != null){
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  bool get isSterilized => _isSterilized.value;

  void setIsSterilized(bool? value){
    if(value == null) return;
    _isSterilized.value = value;
  }
}