import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/widgets/navigation/generic_appbar.dart';
import 'package:mobile_app_template/core/widgets/texts/section_title.dart';
import 'package:mobile_app_template/features/events/controllers/view_event_controller.dart';
import 'package:mobile_app_template/features/events/widgets/event_list_item.dart';

class ViewEventsScreen extends StatelessWidget {
  final _controller = Get.find<ViewEventController>();
  ViewEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GenericAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultScreenPadding),
          child: Obx(() {
            final upcomingEvents = _controller.upcomingEvents;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SectionTitle(title: "Upcoming Events"),
                if (upcomingEvents.isEmpty)
                  const Text("--No Upcoming Events")
                else
                  ...upcomingEvents.map((event) => EventListItem(event: event)),
                const SectionTitle(title: "Ongoing Events"),
                const SectionTitle(title: "Past Events"),
              ],
            );
          }),
        ),
      ),
    );
  }
}
