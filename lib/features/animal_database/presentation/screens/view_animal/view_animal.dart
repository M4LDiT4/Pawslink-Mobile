import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app_template/core/widgets/navigation/generic_appbar.dart';
import 'package:mobile_app_template/features/animal_database/presentation/screens/view_animal/view_animal_summary.dart';
import 'package:mobile_app_template/features/animal_database/presentation/widgets/tri_purpose_fab/view_animal_tri_purpose_fab.dart';

class ViewAnimalScreen extends StatefulWidget {
  const ViewAnimalScreen({super.key});

  @override
  State<ViewAnimalScreen> createState() => _ViewAnimalScreenState();
}

class _ViewAnimalScreenState extends State<ViewAnimalScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  late AnimationController _fabAnimationController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _fabAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {}); // Rebuild FAB when tab index changes
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _fabAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GenericAppbar(
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
          Center(child: Text('Profile')),
        ],
      ),
      floatingActionButton: ViewAnimalTriPurposeFab(isVisible: _tabController.index == 1),
    );
  }
}
