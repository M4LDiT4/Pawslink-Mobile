import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:mobile_app_template/features/animal_database/controllers/view_animal_controller.dart';

class AnimalSummaryActionsMenu extends StatefulWidget {
  const AnimalSummaryActionsMenu({super.key});

  @override
  State<AnimalSummaryActionsMenu> createState() => _AnimalSummaryActionsMenuState();
}

class _AnimalSummaryActionsMenuState extends State<AnimalSummaryActionsMenu>
    with SingleTickerProviderStateMixin {
  late final AnimationController _rotationController;
  final controller = Get.find<ViewAnimalController>();

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  void _onTap() async {
    // Start rotation
    _rotationController.repeat();
    await controller.checkIfUpdatesAvailable();
    // Stop rotation
    _rotationController.stop();
    _rotationController.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.updatesAvailable.value) {
        return IconButton(
          onPressed: () {
            // Handle update action
          },
          icon: const Icon(Iconsax.refresh_circle),
          tooltip: "Update available",
        );
      } else {
        return RotationTransition(
          turns: _rotationController,
          child: IconButton(
            onPressed: _onTap,
            icon: const Icon(Iconsax.refresh),
            tooltip: "Check for updates",
          ),
        );
      }
    });
  }
}
