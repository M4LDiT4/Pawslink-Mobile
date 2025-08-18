import 'package:flutter/material.dart';
import 'package:mobile_app_template/services/navigation/navigation_service.dart';

class AnimalMedicationForm extends StatefulWidget {
  final String title;
  const AnimalMedicationForm({
    required this.title,
    super.key
  });

  @override
  State<AnimalMedicationForm> createState() => _AnimalMedicationFormState();
}

class _AnimalMedicationFormState extends State<AnimalMedicationForm> {
  
  void _closeModal() {
    TNavigationService.back();
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
        //medicationName,.
        //dosage
        // route
        //date given
        //duration in days
        //reason
        //prescribedBy
      //notes
      ],
    );
  }
}