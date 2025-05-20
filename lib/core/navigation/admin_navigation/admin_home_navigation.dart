import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app_template/core/widgets/navigation/generic_appbar.dart';
import 'package:mobile_app_template/core/navigation/admin_navigation/admin_navigation_controller.dart';

class AdminHomeNavigation extends StatelessWidget {
  final controller = Get.put(AdminNavigationController());
  AdminHomeNavigation({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const GenericAppbar(),
      bottomNavigationBar: Obx(
        () => NavigationBar(
        selectedIndex: controller.selectedIndex.value,
        onDestinationSelected: controller.setSelectedIndex,
        
        destinations:const  [
          NavigationDestination(icon: Icon(Iconsax.pet), label: "Database"),
          NavigationDestination(icon: Icon(Iconsax.calendar), label: "Events"),
          NavigationDestination(icon: Icon(Iconsax.home), label: "Adoption"),
          NavigationDestination(icon: Icon(Iconsax.user_octagon), label: "User Help"),
          NavigationDestination(icon: Icon(Iconsax.setting), label: "Settings"),
        ]),
      ),
      body: Obx(()=>controller.getCurrentScreen()),
    );
  }
}