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

  Future<void> _onTap() async {
    _rotationController.repeat();
    await controller.checkIfUpdatesAvailable();
    _rotationController.stop();
    _rotationController.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final updates = controller.updatesAvailable.value;

      if (updates != null) {
        return _buildUpdateButton(updates);
      }

      return RotationTransition(
        turns: _rotationController,
        child: IconButton(
          onPressed: _onTap,
          icon: const Icon(Iconsax.refresh_circle, size: 28),
          tooltip: "Check for updates",
        ),
      );
    });
  }

  /// Builds the badge with the update count
  Widget _buildBadge(int count) {
    if (count <= 0) return const SizedBox.shrink();

    return Positioned(
      left: 2,
      bottom: 2,
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        constraints: const BoxConstraints(
          minWidth: 18,
          minHeight: 18,
        ),
        child: Center(
          child: Text(
            count.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the button when updates are available / checked
  Widget _buildUpdateButton(int count) {
    final icon = count == 0
        ? const Icon(Iconsax.check, size: 28) // No updates
        : const Icon(Icons.download, size: 28); // Updates available

    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(
          onPressed: count == 0 
            ? null 
            :controller.updateAnimals, 
          icon: icon,
          tooltip: count == 0 ? "Up to date" : "Updates available",
        ),
        _buildBadge(count),
      ],
    );
  }

}
