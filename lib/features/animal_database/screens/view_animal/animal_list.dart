import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_template/core/enums/widget_status.dart';
import 'package:mobile_app_template/features/animal_database/controllers/view_animal_list_controller.dart';
import 'package:mobile_app_template/features/animal_database/widgets/animal_profile_list_item.dart';

class AnimalListScreen extends StatefulWidget {
  const AnimalListScreen({super.key});

  @override
  State<AnimalListScreen> createState() => _AnimalListScreenState();
}

class _AnimalListScreenState extends State<AnimalListScreen> {
  final ViewAnimalListController controller = Get.find<ViewAnimalListController>();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 100) {
        if (controller.status.value != WidgetStatus.loading &&
            controller.canLoadMore.value) {
          controller.loadAnimals();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final items = controller.animals;
        final isLoading = controller.status.value == WidgetStatus.loading;
        final canLoadMore = controller.canLoadMore.value;

        if (items.isEmpty && isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (items.isEmpty) {
          return const Center(child: Text("No animals found"));
        }

        return ListView.separated(
          controller: _scrollController,
          itemCount: items.length +
              (isLoading ? 1 : 0) +
              (!canLoadMore && !isLoading ? 1 : 0),
          itemBuilder: (context, index) {
            if (index < items.length) {
              return AnimalProfileListItem(profile: items[index]);
            }

            if (isLoading && index == items.length) {
              return const Padding(
                padding: EdgeInsets.all(16),
                child: Center(child: CircularProgressIndicator()),
              );
            }

            if (!canLoadMore && index == items.length) {
              return const Padding(
                padding: EdgeInsets.all(16),
                child: Center(child: Text("End of content")),
              );
            }

            return const SizedBox.shrink();
          },
          separatorBuilder: (_, index) {
            // Show separator only between list items, not after loaders or end marker
            if (index < items.length - 1) {
              return const Divider(height: 1);
            }
            return const SizedBox.shrink();
          },
        );
      }),
    );
  }
}
