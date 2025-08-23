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
import 'package:mobile_app_template/domain/entities/animal_medication_dto.dart';
import 'package:mobile_app_template/navigation/navigation_service.dart';

class AnimalMedicationForm extends StatefulWidget {
  final String title;
  const AnimalMedicationForm({
    required this.title,
    super.key,
  });



  @override
  State<AnimalMedicationForm> createState() => _AnimalMedicationFormState();
}

class _AnimalMedicationFormState extends State<AnimalMedicationForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController medicationNameController;
  late TextEditingController reasonController;
  late TextEditingController durationController;
  late GenericDatepickerController dateGivenController;
  late TextEditingController routeController;
  late TextEditingController dosageController;
  late TextEditingController prescribedByController;
  late TagInputController notesController;

  @override
  void initState(){
    super.initState();
    try{
      final data = Get.arguments;
      if(data is! RecordListItem){
        _initializeNoData();
        return;
      }
      final prevData = data.data as AnimalMedicationDTO;
      _initializeWithData(prevData);
    }catch(err){
      TLogger.error(err.toString());
      _initializeNoData();
    }
  }

  void _initializeNoData(){
    medicationNameController = TextEditingController();
    reasonController = TextEditingController();
    durationController = TextEditingController();
    dateGivenController = GenericDatepickerController();
    routeController = TextEditingController();
    dosageController = TextEditingController();
    prescribedByController = TextEditingController();
    notesController = TagInputController();
  }

  void _initializeWithData(AnimalMedicationDTO prevData){
    medicationNameController = TextEditingController(text: prevData.medicationName);
    reasonController = TextEditingController(text: prevData.reason);
    durationController = TextEditingController(text: prevData.durationInDays.toString());
    dateGivenController = GenericDatepickerController(initialDate: prevData.dateGiven);
    routeController = TextEditingController(text: prevData.route);
    dosageController = TextEditingController(text: prevData.dosage);
    notesController = TagInputController(items: prevData.notes);
  }

  void _closeModal() => TNavigationService.back();

  void _handleSaveBttnTap(){
    final formValid = _formKey.currentState!.validate();
    final dateGivenValid = dateGivenController.validate();

    if(formValid && dateGivenValid){
      final medRex = AnimalMedicationDTO(
        medicationName: medicationNameController.text, 
        dosage: dosageController.text, 
        route: routeController.text, 
        dateGiven: dateGivenController.selectedDate!, 
        durationInDays: int.parse(durationController.text), 
        reason: reasonController.text, 
        prescribedBy: prescribedByController.text,
        notes: notesController.items
      );
      TNavigationService.back(result: RecordListItem(
        title: medRex.medicationName, 
        subTitle: TFormatter.formatDate(medRex.dateGiven), 
        data: medRex)
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(),
        const SizedBox(height: 16),
        _buildFormFields(),
        const SizedBox(height: 16),
        const TagInput(title: "Notes"),
        const SizedBox(height: 24),
        _buildActions(),
      ],
    );
  }

  /// HEADER
  Widget _buildHeader() {
    return Row(
      children: [
        Expanded(
          child: Text(
            widget.title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        IconButton(onPressed: _closeModal, icon: const Icon(Icons.close)),
      ],
    );
  }

  /// FORM FIELDS
  Widget _buildFormFields() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            children: [
              GenericTextfieldBuilder
                .formField(label: "Medication Name")
                .required()
                .build(),
            ],
          ),
          Row(
            children: [
              GenericTextfieldBuilder
                .formField(label: "Reason")
                .required()
                .build(),
            ],
          ),
          Row(
            children: [
              GenericTextfieldBuilder
                .formField(label: "Duration")
                .suffixString('days')
                .required()
                .build(),
              const GenericDatePickerButton(
                  labelText: "Date Given",
              ),
            ],
          ),
          Row(
            children: [
             GenericTextfieldBuilder
                .formField(label: "Route")
                .required()
                .build(),
              GenericTextfieldBuilder
                .formField(label: "Dosage")
                .required()
                .build(),
            ],
          ),
          Row(
            children: [
              GenericTextfieldBuilder
                .formField(label: "Administered by")
                .required()
                .build(),
            ],
          ),
        ],
      ),
    );
  }

  /// ACTION BUTTONS
  Widget _buildActions() {
    return Row(
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
    );
  }
}
