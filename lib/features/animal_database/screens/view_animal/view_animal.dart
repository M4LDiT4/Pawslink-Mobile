import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app_template/core/dependency_injection/dependency_injection.dart';
import 'package:mobile_app_template/core/widgets/navigation/generic_appbar.dart';
import 'package:mobile_app_template/domain/services/animal%20database/animal_database_service.dart';
import 'package:mobile_app_template/features/animal_database/controllers/view_animal_controller.dart';
import 'package:mobile_app_template/features/animal_database/controllers/view_animal_list_controller.dart';
import 'package:mobile_app_template/features/animal_database/screens/view_animal/animal_list.dart';
import 'package:mobile_app_template/features/animal_database/screens/view_animal/view_animal_summary.dart';
import 'package:mobile_app_template/features/animal_database/widgets/app_bars/animal_list_actions_menu.dart';
import 'package:mobile_app_template/features/animal_database/widgets/app_bars/view_animal_action_menu.dart';
import 'package:mobile_app_template/features/animal_database/widgets/view_animal_profile_slider/view_animal_slider_controller.dart';

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
    final sliderController = ViewAnimalSliderController(parentTab: _tabController);
    getIt.registerSingleton<ViewAnimalSliderController>(sliderController);
    Get.put(ViewAnimalController(getIt<AnimalDatabaseService>()));
  }

  @override
  void dispose() {
    _tabController.dispose();
    getIt.unregister<ViewAnimalSliderController>();
    super.dispose();
  }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GenericAppbar(
        actions:[
          _tabController.index == 0? const AnimalSummaryActionsMenu()
            :AnimalListActionsMenu()
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
