import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/enums/widget_status.dart';
import 'package:mobile_app_template/features/animal_database/widgets/view_animal_profile_slider/view_animal_profile_slider_item.dart';
import 'view_animal_slider_controller.dart';

class ViewAnimalProfileSlider extends StatefulWidget {
  const ViewAnimalProfileSlider({super.key});

  @override
  State<ViewAnimalProfileSlider> createState() => _ViewAnimalProfileSliderState();
}

class _ViewAnimalProfileSliderState extends State<ViewAnimalProfileSlider> {
  late final ViewAnimalSliderController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ViewAnimalSliderController();
    // Delay initial data load to ensure widget is mounted
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_controller.hasLoaded) {
        _controller.loadInitialData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  "Recents",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: TColors.primary,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Build content based on controller state
            _buildContent(),
          ],
        );
      },
    );
  }

  Widget _buildContent() {
    if (_controller.status == WidgetStatus.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_controller.status == WidgetStatus.error) {
      return const Center(
        child: Text(
          "Failed to load animals",
          style:  TextStyle(color: Colors.red),
        ),
      );
    }

    if (_controller.animals.isEmpty) {
      return const Center(
        child: Text("No recent animals found"),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ..._controller.animals.map(
            (animal) => ViewAnimalProfileSliderItem(animal: animal),
          ),
          TextButton(
            onPressed: () {
              // Navigate to full list page
            },
            child: const Text("View More"),
          ),
        ],
      ),
    );
  }
}
