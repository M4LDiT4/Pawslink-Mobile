import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app_template/core/navigation/routes/app_routes.dart';

import 'package:mobile_app_template/core/widgets/navigation/generic_appbar.dart';
import 'package:mobile_app_template/core/navigation/admin_navigation/admin_navigation_controller.dart';
import 'package:mobile_app_template/services/local_storage/local_secure_storage.dart';
import 'package:mobile_app_template/services/navigation_service.dart';

class AdminHomeNavigation extends StatefulWidget {
  const AdminHomeNavigation({super.key});

  @override
  State<AdminHomeNavigation> createState() => _AdminHomeNavigationState();
}

class _AdminHomeNavigationState extends State<AdminHomeNavigation> {
  final controller = Get.put(AdminNavigationController());
  late LocalSecureStorageService _storage;
  @override
  void initState() {
    super.initState();
    _storage = LocalSecureStorageService();
    _checkToken();
  }

  Future<void> _checkToken() async {
    final accessToken  = await _storage.getData(LocalSecureStorageService.accessToken);
    if(accessToken == null){
      TNavigationService.offAllNamed(TAppRoutes.login);
    }
    // todo: if user is online, check if access token is valid
    // todo: if valid, do nothing (e.g. return)
    // todo: if otherwise, rotate the token
    // todo: if there is a new access token, save it and return
    // todo: otherwise, return session terminated and go to the login 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GenericAppbar(),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: controller.setSelectedIndex,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.pet), label: "Database"),
            NavigationDestination(icon: Icon(Iconsax.calendar), label: "Events"),
            NavigationDestination(icon: Icon(Iconsax.home), label: "Adoption"),
            NavigationDestination(icon: Icon(Iconsax.user_octagon), label: "User Help"),
            NavigationDestination(icon: Icon(Iconsax.setting), label: "Settings"),
          ],
        ),
      ),
      body: Obx(() => controller.getCurrentScreen()),
    );
  }
}
