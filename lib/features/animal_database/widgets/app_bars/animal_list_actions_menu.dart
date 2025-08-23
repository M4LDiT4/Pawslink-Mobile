import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:mobile_app_template/core/utils/helpers/ui_helpers.dart';
import 'package:mobile_app_template/core/enums/animal_sex.dart';
import 'package:mobile_app_template/core/enums/animal_species.dart';
import 'package:mobile_app_template/core/enums/animal_status.dart';
import 'package:mobile_app_template/core/widgets/dropdowns/generic_dropdown_controller.dart';
import 'package:mobile_app_template/domain/services/local/animal_repository.dart';
import 'package:mobile_app_template/features/animal_database/controllers/view_animal_list_controller.dart';
import 'package:mobile_app_template/features/animal_database/screens/view_animal/search_animal_screen.dart';
import 'package:mobile_app_template/features/animal_database/widgets/modals/filter_config.dart';
import 'package:mobile_app_template/features/animal_database/widgets/modals/sort_config.dart';
import 'package:mobile_app_template/navigation/navigation_service.dart';

/// Separate widget for the top-right actions menu
class AnimalListActionsMenu extends StatelessWidget {
  AnimalListActionsMenu({super.key});

  final _controller = Get.find<ViewAnimalListController>();

  void _setSortConfig(AnimalSortBy? sortBy, Sort? sort){
    _controller.setSortConfig(
      sortBy: sortBy,
      sortOrder: sort
    );
  }

  void _setFilterConfig(AnimalSex? sex, AnimalSpecies? species, AnimalStatus? status){
    _controller.setFilterConfig(
      sex: sex,
      species: species,
      status: status
    );
  }

  Future<void> _showSortModal(BuildContext context) async {
    final sortByController = GenericDropdownController<AnimalSortBy>();
    final sortOrderController = GenericDropdownController<Sort>();

    await TUIHelpers.showDefaultDialog(
      SortModal(sortByController: sortByController, sortOrderController: sortOrderController),
      title: "Configure Sort",
      onConfirm: () => _setSortConfig(
        sortByController.selectedValue, 
        sortOrderController.selectedValue
      )
    );
  }

  Future<void> _showFilterModal(BuildContext context) async {
    final sexController = GenericDropdownController<AnimalSex>();
    final statusController = GenericDropdownController<AnimalStatus>();
    final speciesController = GenericDropdownController<AnimalSpecies>();

    /// initial values
    sexController.initialValue(_controller.sex);
    statusController.initialValue(_controller.animalStatus);
    speciesController.initialValue(_controller.species);
    await TUIHelpers.showDefaultDialog(
      FilterModal(
        sexController: sexController, 
        statusController: statusController, 
        speciesController: speciesController
      ),
      title: "Configure Filter",
      onConfirm: () => _setFilterConfig(
        sexController.selectedValue, 
        speciesController.selectedValue, 
        statusController.selectedValue
      )
    );
  }

  void _handleSearch() {
    TNavigationService.to(const SearchAnimalPage());
  }

  void _handleMenuSelection(BuildContext context, String value) {
    if (value == "sort") {
      _showSortModal(context);
    } else if (value == "filter") {
      _showFilterModal(context);
    } else if (value == "search") {
      _handleSearch();
    } 
    
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) => _handleMenuSelection(context, value),
      itemBuilder: (context) => const [
        PopupMenuItem(
          value: "sort",
          child: Text("Sort"),
        ),
        PopupMenuItem(
          value: "filter",
          child: Text("Filter"),
        ),
        PopupMenuItem(
          value: "search",
          child: Text("Search"),
        ),
    ],
    );
  }
}
