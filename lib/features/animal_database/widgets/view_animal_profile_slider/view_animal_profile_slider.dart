import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/dependency_injection/dependency_injection.dart';
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
    _controller = getIt<ViewAnimalSliderController>();

    // Load initial data after widget is mounted
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 8),
            _buildContent(),
          ],
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Text(
      "Recents",
      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: TColors.primary,
          ),
    );
  }

  Widget _buildContent() {
    switch (_controller.status) {
      case WidgetStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case WidgetStatus.error:
        return const Center(
          child: Text(
            "Failed to load animals",
            style: TextStyle(color: Colors.red),
          ),
        );
      case WidgetStatus.idle:
      default:
        return _controller.animals.isEmpty
            ? const Center(child: Text("No recent animals found"))
            : _buildAnimalList();
    }
  }

  Widget _buildAnimalList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ..._controller.animals.map(
            (animal) => ViewAnimalProfileSliderItem(animal: animal),
          ),
          TextButton(
            onPressed:_controller.gotoAnimalList,
            child: const Text("View More"),
          ),
        ],
      ),
    );
  }
}
