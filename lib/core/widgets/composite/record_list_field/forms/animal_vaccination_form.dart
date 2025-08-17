import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mobile_app_template/core/utils/formatters/formatter.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';
import 'package:mobile_app_template/core/widgets/buttons/secondary_elevated_button.dart';
import 'package:mobile_app_template/core/widgets/composite/record_list_field/record_list_item.dart';
import 'package:mobile_app_template/core/widgets/pickers/date_pickers/generic_date_picker.dart';
import 'package:mobile_app_template/core/widgets/pickers/date_pickers/generic_datepicker_controller.dart';
import 'package:mobile_app_template/core/widgets/text_fields/generic_text_field/generic_textfield_builder.dart';
import 'package:mobile_app_template/core/widgets/text_fields/tag_input/tag_input.dart';
import 'package:mobile_app_template/core/widgets/text_fields/tag_input/tag_input_controller.dart';
import 'package:mobile_app_template/core/widgets/ui_utils/fixed_seperator.dart';
import 'package:mobile_app_template/domain/entities/animal_vaccination_dto.dart';
import 'package:mobile_app_template/services/navigation/navigation_service.dart';

class AnimalVaccinationForm extends StatefulWidget {
  final String title;

  const AnimalVaccinationForm({
    super.key,
    required this.title,
  });

  @override
  State<AnimalVaccinationForm> createState() => _AnimalVaccinationFormState();
}

class _AnimalVaccinationFormState extends State<AnimalVaccinationForm> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController vaxNameController;
  late GenericDatepickerController dateGivenController;
  late TextEditingController doseNumberController;
  late GenericDatepickerController nextDueDateController;
  late TextEditingController administeredByController;
  late TextEditingController batchNumberController;
  late GenericDatepickerController expiryDateController;
  late TextEditingController routeController;
  late TagInputController notesController;

  @override
  void initState() {
    super.initState();

    try{
      final data = Get.arguments;
      if(data is! RecordListItem){
        throw Exception("Expects object of type `RecordListItem`, received: ${data.runtimeType}");
      }
      final prevData = data.data as AnimalVaccinationDTO;
      vaxNameController = TextEditingController(text: prevData.vaccineName);
      dateGivenController =
          GenericDatepickerController(initialDate: prevData.dateGiven);
      doseNumberController =
          TextEditingController(text: prevData.doseNumber.toString());
      nextDueDateController =
          GenericDatepickerController(initialDate: prevData.nextDueDate);
      administeredByController =
          TextEditingController(text: prevData.administeredBy);
      batchNumberController =
          TextEditingController(text: prevData.batchNumber.toString() );
      expiryDateController =
          GenericDatepickerController(initialDate: prevData.expiryDate);
      routeController = TextEditingController(text: prevData.route );
      notesController = TagInputController(items: prevData.notes);
    }catch(err){
      TLogger.error(err.toString());
      _initializeNoPrevData();
    }
  }

  void _initializeNoPrevData(){
    vaxNameController = TextEditingController();
    dateGivenController = GenericDatepickerController();
    doseNumberController = TextEditingController();
    nextDueDateController = GenericDatepickerController();
    administeredByController = TextEditingController();
    batchNumberController = TextEditingController();
    expiryDateController = GenericDatepickerController();
    routeController = TextEditingController();
    notesController = TagInputController();
  }

  void _closeModal() {
    TNavigationService.back();
  }

  void _handleSaveBttnTap() {
    final formValid = _formKey.currentState!.validate();
    final dateGivenValid = dateGivenController.validate();
    final nextDueDateValid = nextDueDateController.validate();
    final expiryDateValid = expiryDateController.validate();

    if (formValid && dateGivenValid && nextDueDateValid && expiryDateValid) {
      final vaxRec = AnimalVaccinationDTO(
        vaccineName: vaxNameController.text,
        dateGiven: dateGivenController.selectedDate!,
        doseNumber: int.tryParse(doseNumberController.text) ?? 0,
        administeredBy: administeredByController.text,
        batchNumber: int.tryParse(batchNumberController.text) ?? 0,
        expiryDate: expiryDateController.selectedDate!,
        route: routeController.text,
        notes: notesController.items,
        nextDueDate: nextDueDateController.selectedDate,
      );

      TNavigationService.back(
        result: RecordListItem(
          title: vaxRec.vaccineName,
          subTitle: TFormatter.formatDate(vaxRec.dateGiven),
          data: vaxRec,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                widget.title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            IconButton(onPressed: _closeModal, icon: const Icon(Icons.close)),
          ],
        ),
        Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GenericTextfieldBuilder
                      .formField(label: "Vaccine Name")
                      .controller(vaxNameController)
                      .required()
                      .build(),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GenericDatePickerButton(
                    labelText: "Date Given",
                    controller: dateGivenController,
                    isRequired: true,
                  ),
                  GenericDatePickerButton(
                    labelText: "Next Due Date",
                    controller: nextDueDateController,
                    isRequired: false,
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GenericTextfieldBuilder
                      .formField(label: "Dose Number")
                      .controller(doseNumberController)
                      .keyboardType(TextInputType.number)
                      .build(),
                  GenericTextfieldBuilder
                      .formField(label: "Batch Number")
                      .controller(batchNumberController)
                      .required()
                      .keyboardType(TextInputType.number)
                      .build(),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GenericDatePickerButton(
                    labelText: "Expiry Date",
                    controller: expiryDateController,
                    isRequired: true,
                  ),
                  GenericTextfieldBuilder
                      .formField(label: "Route")
                      .controller(routeController)
                      .required()
                      .build(),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GenericTextfieldBuilder
                      .formField(label: "Administered By")
                      .controller(administeredByController)
                      .required()
                      .build(),
                ],
              ),
              TagInput(
                title: "Notes",
                controller: notesController,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Row(
            children: [
              Expanded(
                child: SecondaryElevatedButton(
                  onPressed: _closeModal,
                  child: const Text("Cancel"),
                ),
              ),
              const FixedSeparator(
                space: 12,
                orientation: SeparatorOrientation.horizontal,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: _handleSaveBttnTap,
                  child: const Text("Save"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
