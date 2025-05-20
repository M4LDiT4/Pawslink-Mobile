import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app_template/core/widgets/navigation/generic_appbar.dart';
import 'package:mobile_app_template/features/animal_database/presentation/screens/view_animal/view_animal_summary.dart';

class ViewAnimalScreen extends StatelessWidget {
  const ViewAnimalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: GenericAppbar(
          bottom: TabBar(
            tabs: [
              Tab(text: 'Summary', icon: Icon(Iconsax.document)),
              Tab(text: 'Animal List', icon: Icon(Iconsax.menu)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ViewAnimalSummaryScreen(),
            Center(child: Text('Profile')),
          ],
        ),
      ),
    );
  }
}