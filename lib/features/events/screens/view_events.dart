import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_app_template/core/constants/lottie_strings.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/widgets/navigation/generic_appbar.dart';
import 'package:mobile_app_template/features/events/controllers/view_event_controller.dart';
import 'package:mobile_app_template/features/events/widgets/event_list_item.dart';

class ViewEventsScreen extends StatefulWidget {
  const ViewEventsScreen({super.key});

  @override
  State<ViewEventsScreen> createState() => _ViewEventsScreenState();
}

class _ViewEventsScreenState extends State<ViewEventsScreen> {
  late final ViewEventController _controller;
  late final ScrollController _scrollController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller = Get.find<ViewEventController>();
    _scrollController = ScrollController()
      ..addListener(_onScrollEnd);
    _loadMoreItems(); 
  }

  void _onScrollEnd() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent &&
        !_isLoading) {
      _loadMoreItems();
    }
  }

  Future<void> _loadMoreItems() async {
    setState(() => _isLoading = true);
    await _controller.getEvents(); // Your fetch logic
    setState(() => _isLoading = false);
  }

  Future<void> _reloadScreen() async {
    _controller.pageNum = 0; // reset the page number to zero
    await _controller.refreshEvents();
  }

  Widget _buildEventList(BuildContext context) {
    return Obx(() => ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
        controller: _scrollController,
        itemCount: _controller.events.length + 1,
        itemBuilder: (context, index) {
          if (index == _controller.events.length) {
            return Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 24),
              child: Center(
                child: _isLoading? Lottie.asset(
                  TLottie.rotatingCat,
                  width: 60,
                )
                : _controller.isLastPage? const Text("End of Content")
                : const Text("Scroll up to load more")
              ),
            );
          }
          return EventListItem(event: _controller.events[index]);
        },
      )
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GenericAppbar(),
      body: Padding(
        padding:
          const EdgeInsets.symmetric(horizontal: TSizes.defaultScreenPadding),
          child: RefreshIndicator(
            onRefresh: _reloadScreen,
            child: _buildEventList(context)
          ),
      ),
    );
  }
}
