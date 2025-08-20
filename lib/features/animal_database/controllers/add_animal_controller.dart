

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_template/core/dependency_injection/dependency_injection.dart';
import 'package:mobile_app_template/core/enums/animal_sex.dart';
import 'package:mobile_app_template/core/enums/animal_species.dart';
import 'package:mobile_app_template/core/enums/animal_status.dart';
import 'package:mobile_app_template/core/navigation/routes/app_routes.dart';
import 'package:mobile_app_template/core/utils/formatters/formatter.dart';
import 'package:mobile_app_template/core/utils/helpers/ui_helpers.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';
import 'package:mobile_app_template/core/widgets/composite/record_list_field/record_list_field_controller.dart';
import 'package:mobile_app_template/core/widgets/composite/record_list_field/record_list_item.dart';
import 'package:mobile_app_template/core/widgets/dialogs/async_generic_loader/async_generic_loader.dart';
import 'package:mobile_app_template/core/widgets/dialogs/save_to_drafts/save_to_drafts_dialog.dart';
import 'package:mobile_app_template/core/widgets/dropdowns/generic_dropdown_controller.dart';
import 'package:mobile_app_template/core/widgets/pickers/date_pickers/generic_datepicker_controller.dart';
import 'package:mobile_app_template/core/widgets/pickers/img_pickers/generic_img_picker_controller.dart';
import 'package:mobile_app_template/core/widgets/text_fields/tag_input/tag_input_controller.dart';
import 'package:mobile_app_template/domain/entities/animal_dto.dart';
import 'package:mobile_app_template/domain/entities/animal_medication_dto.dart';
import 'package:mobile_app_template/domain/entities/animal_vaccination_dto.dart';
import 'package:mobile_app_template/domain/repositories/animal_database_repository.dart';
import 'package:mobile_app_template/network/internet_connection/connection_controller.dart';
import 'package:mobile_app_template/network/operation_response.dart';
import 'package:mobile_app_template/services/navigation/navigation_service.dart';

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
  late GenericDropdownController<AnimalSex> sexController;
  late GenericDropdownController<AnimalSpecies> speciesController;
  late GenericDropdownController<AnimalStatus> statusController;
  late GenericDatepickerController sterilizationDateController;
  
  // tag input controllers
  late TagInputController coatController;
  late TagInputController traitsController;
  late TagInputController notesController;

  // form inputs
  late RecordListFieldController vaccinationController;
  late RecordListFieldController medicationController;

  final RxBool _isSterilized = false.obs;

  late final AnimalDatabaseRepository _repo;
  late final ConnectionController _connectionController;

  AddAnimalController({
    this.prevAnimal,
  });

  @override
  void onInit(){
    super.onInit();
    if(prevAnimal != null){
      _initWithData();
    }else{
      _initWithNoData();
    }
    _repo = getIt<AnimalDatabaseRepository>();
    _connectionController = Get.find<ConnectionController>();
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
      selectedValue: prevData.sex
    );
    speciesController = GenericDropdownController(
      selectedValue: prevData.species
    );
    statusController = GenericDropdownController(
      selectedValue: prevData.status
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
      _addAnimal();
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

  Future<void> _addAnimal() async{
    final animal = AnimalDTO(
      name: nameController.text, 
      sex: sexController.selectedValue!, 
      status: statusController.selectedValue!, 
      species: speciesController.selectedValue!, 
      location: locationController.text,
      coatColor: coatController.items,
      traitsAndPersonality: traitsController.items,
      notes: notesController.items,
      medicationHistory: medicationController.getValues().map((el) => el as AnimalMedicationDTO).toList(),
      vaccinationHistory: vaccinationController.getValues().map((el) => el as AnimalVaccinationDTO).toList(),
    );

    if(_connectionController.isConnected){

    }

    final saveToLocal = await TUIHelpers.showResponsiveModal<bool>(child: const SaveToDraftsDialog());
    if(saveToLocal != null && saveToLocal){
      final result = await TUIHelpers.showResponsiveModal<OperationResponse<AnimalDTO>>(
        child: AsyncGenericLoader(asyncFunction: () async{
          return _repo.saveAnimalLocally(animal, File(imgPickerController.selectedImage!.path));
        })
      );

      if( result == null || !result.isSuccessful){
        TNavigationService.until(TAppRoutes.home);
      }else{
        TNavigationService.until(TAppRoutes.home);
        if(result.data != null){
          TLogger.info(jsonEncode(result.data!.toMap()));
          TNavigationService.toNamed(TAppRoutes.viewAnimalDetails, arguments: result.data);
        }
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