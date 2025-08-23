import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/enums/animal_sex.dart';
import 'package:mobile_app_template/core/enums/animal_species.dart';
import 'package:mobile_app_template/core/enums/animal_status.dart';
import 'package:mobile_app_template/core/widgets/buttons/info_tool_tip.dart';
import 'package:mobile_app_template/core/widgets/dropdowns/generic_dropdown.dart';
import 'package:mobile_app_template/core/widgets/dropdowns/generic_dropdown_controller.dart';

/// Filter configuration modal
class FilterModal extends StatelessWidget {
  const FilterModal({
    super.key,
    required this.sexController,
    required this.statusController,
    required this.speciesController
  });

  final GenericDropdownController<AnimalSex> sexController;
  final GenericDropdownController<AnimalStatus> statusController;
  final GenericDropdownController<AnimalSpecies> speciesController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Expanded(
              child: InfoTooltip(
                message:
                    "Filter animals by sex (male/female), status (e.g., healthy, sick), "
                    "species, or age range. Combine filters to refine results, or clear them to view all animals.",
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
             GenericDropdown(
              initialValue: sexController.selectedValue,
              options: AnimalSex.values, labelText: "Sex",
              controller: sexController,
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            GenericDropdown(
              initialValue: speciesController.selectedValue,
              options: AnimalSpecies.values, labelText: "Species",
              controller: speciesController,
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            GenericDropdown(
              initialValue: statusController.selectedValue,
              options: AnimalStatus.values, labelText: "Status",
              controller: statusController,
            ),
          ],
        ),
      ],
    );
  }
}
