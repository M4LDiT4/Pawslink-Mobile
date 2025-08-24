import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:mobile_app_template/features/animal_database/controllers/view_animal_controller.dart';

class AnimalSummaryActionsMenu extends StatefulWidget {
  const AnimalSummaryActionsMenu({super.key});

  @override
  State<AnimalSummaryActionsMenu> createState() => _AnimalSummaryActionsMenu();
}

class _AnimalSummaryActionsMenu extends State<AnimalSummaryActionsMenu>
  with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final _viewAnimalController = Get.find<ViewAnimalController>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();

    // rotation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();

    _runAsyncTask();
  }

  Future<void> _runAsyncTask() async {
    try {
      // Example async task
      await _viewAnimalController.checkUpdates();
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
          _controller.stop();
        });
      }
    }
  }

  void _update() async{
    //update logic here
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Center(
      child: _loading
          ? RotationTransition(
              turns: _controller,
              child: const Icon(Icons.sync, size: 48),
            )
          : _viewAnimalController.updatesAvailable.value
          ? IconButton(
              onPressed: _update, 
              icon: Icon(
                Icons.update,
                size: 48,
                color: Theme.of(context).colorScheme.primary,
              )
            )
          : const Icon(Icons.check, size: 48, color: Colors.green),
        );
      }
    );
  }
}
