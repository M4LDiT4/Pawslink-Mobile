import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:isar/isar.dart';
import 'package:mobile_app_template/core/enums/animal_sex.dart';
import 'package:mobile_app_template/core/enums/animal_species.dart';
import 'package:mobile_app_template/core/enums/animal_status.dart';
import 'package:mobile_app_template/core/utils/helpers/ui_helpers.dart';
import 'package:mobile_app_template/core/widgets/buttons/info_tool_tip.dart';
import 'package:mobile_app_template/core/widgets/dropdowns/generic_dropdown.dart';
import 'package:mobile_app_template/core/widgets/navigation/generic_appbar.dart';
import 'package:mobile_app_template/domain/services/local/animal_repository.dart';
import 'package:mobile_app_template/features/animal_database/controllers/view_animal_list_controller.dart';
import 'package:mobile_app_template/features/animal_database/screens/search_animal_screen.dart';
import 'package:mobile_app_template/features/animal_database/screens/view_animal/animal_list.dart';
import 'package:mobile_app_template/features/animal_database/screens/view_animal/view_animal_summary.dart';
import 'package:mobile_app_template/navigation/navigation_service.dart';

class ViewAnimalScreen extends StatefulWidget {
  const ViewAnimalScreen({super.key});

  @override
  State<ViewAnimalScreen> createState() => _ViewAnimalScreenState();
}

class _ViewAnimalScreenState extends State<ViewAnimalScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {}); // Rebuild FAB when tab index changes
      }
    });
    Get.put(ViewAnimalListController());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _showSortModal()async{
    await TUIHelpers.showDefaultDialog(
      const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: InfoTooltip(
                  message: "Name: sorts alphabetically (A–Z or Z–A). Age: sorts numerically (youngest to oldest or oldest to youngest). Updated At: sorts by most recent update first or oldest update first."
                )
              )
            ],
          ),
          Row(
            children: [
              GenericDropdown(options: AnimalSortBy.values, labelText: 'Sort by', useFilledStyle: true,),
              GenericDropdown(options: Sort.values, labelText: "Sort Order", useFilledStyle: true,)
            ],
          )
        ],
      ),
      title: "Configure Sort"
    );
  }

  void _showFilterModal() async{
    await TUIHelpers.showDefaultDialog(
      const Column(
        children: [
          Row(
            children: [
              Expanded(
                child: InfoTooltip(
                  message:  "Filter animals by sex (male/female), status (e.g., healthy, sick), "
                            "species, or age range. Combine filters to refine results, or clear them to view all animals."
                ),
              ),
            ],
          ),
          Row(
            children: [
              GenericDropdown(options: AnimalSex.values, labelText: "Sex"),
            ],
          ),
          Row(
            children: [
              GenericDropdown(options: AnimalSpecies.values, labelText: "Species"),
            ],
          ),
          Row(
            children: [
              GenericDropdown(options: AnimalStatus.values, labelText: "Status"),
            ],
          ),
        ],
      ),
      title: "Configure Filter"
    );
  }

  void _handleSearch(){
    TNavigationService.to( const SearchAnimalPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GenericAppbar(
        actions:[
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == "sort") {
                _showSortModal();
              } else if (value == "filter") {
                _showFilterModal();
              } else if (value == "search") {
                _handleSearch();
              }else if (value == "check-updates"){
                // handle updates
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: "sort",
                child: Text("Sort"),
              ),
              const PopupMenuItem(
                value: "filter",
                child: Text("Filter"),
              ),
              const PopupMenuItem(
                value: "search",
                child: Text("Search"),
              ),
              const PopupMenuItem(
                value: "check-updates",
                child: Text("Check Updates"),
              ),
            ],
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Summary', icon: Icon(Iconsax.document)),
            Tab(text: 'Animal List', icon: Icon(Iconsax.menu)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ViewAnimalSummaryScreen(),
          AnimalListScreen(),
        ],
      ),
    );
  }
}
