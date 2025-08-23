import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:mobile_app_template/core/widgets/buttons/info_tool_tip.dart';
import 'package:mobile_app_template/core/widgets/dropdowns/generic_dropdown.dart';
import 'package:mobile_app_template/core/widgets/dropdowns/generic_dropdown_controller.dart';
import 'package:mobile_app_template/domain/services/local/animal_repository.dart';       // assume exists

/// Sort configuration modal
class SortModal extends StatelessWidget {
  final GenericDropdownController<AnimalSortBy> sortByController;
  final GenericDropdownController<Sort> sortOrderController;

  const SortModal({
    super.key,
    required this.sortByController,
    required this.sortOrderController
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: InfoTooltip(
                message:
                    "Name: sorts alphabetically (A–Z or Z–A). Age: sorts numerically (youngest to oldest or oldest to youngest). Updated At: sorts by most recent update first or oldest update first.",
              ),
            )
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: GenericDropdown(
                options: AnimalSortBy.values,
                labelText: 'Sort by',
                useFilledStyle: true,
                controller: sortByController,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: GenericDropdown(
                options: Sort.values,
                labelText: "Sort Order",
                useFilledStyle: true,
                controller: sortOrderController,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
