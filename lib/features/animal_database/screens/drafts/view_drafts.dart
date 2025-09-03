import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_app_template/core/constants/lottie_strings.dart';
import 'package:mobile_app_template/core/enums/widget_status.dart';
import 'package:mobile_app_template/features/animal_database/controllers/view_drafts_controller.dart';
import 'package:mobile_app_template/features/animal_database/widgets/view_drafts/view_drafts_list_item.dart';

class ViewDraftsScreen extends StatelessWidget {
  ViewDraftsScreen({super.key});

  final _controller = Get.put(ViewDraftsController());

  EdgeInsets _buildPadding() {
    return _controller.multiSelect.value
        ? const EdgeInsets.symmetric(vertical: 16)
        : const EdgeInsets.all(16);
  }

  void _handleSelectNormalMenu(BuildContext context, String value) {
    if (value == "multiselect") {
      _controller.multiSelect.value = true;
    }
  }

  /// ---------------- BUILD ----------------
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return PopScope(
        canPop: !_controller.multiSelect.value,
        onPopInvokedWithResult: (didPop, result) {
          if (!didPop && _controller.multiSelect.value) {
            _controller.multiSelect.value = false;
            _controller.selectedIdList.clear();
            Get.snackbar(
              "Selection",
              "Selection canceled",
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(seconds: 2),
            );
          }
        },
        child: Scaffold(
          appBar: _buildAppBar(context),
          body: _buildBody(),
          bottomNavigationBar: _buildBottomBar(),
        ),
      );
    });
  }

  /// ---------------- APP BAR ----------------
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          if (_controller.multiSelect.value) {
            // cancel multiselect instead of navigating back
            _controller.multiSelect.value = false;
            _controller.selectedIdList.clear();
          } else {
            Get.back();
          }
        },
      ),
      title: Obx(
        () => !_controller.multiSelect.value
            ? const Text("View Drafts")
            : _controller.selectedIdList.isEmpty
                ? const Text("Select Items")
                : Text("${_controller.selectedIdList.length} selected"),
      ),
      centerTitle: true,
      backgroundColor: const Color(0xFFDB7093),
      elevation: 4,
      actions: [
        Obx(() => _controller.multiSelect.value
            ? Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.select_all),
                    tooltip: "Select All",
                    onPressed: () {
                      _controller.selectedIdList.assignAll(
                        _controller.animalDrafts.map((e) => e.remoteId ?? ""),
                      );
                    },
                  ),
                  PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == "delete") {
                        // delete logic
                      } else if (value == "upload") {
                        // upload logic
                      }
                    },
                    itemBuilder: (context) => const [
                      PopupMenuItem(
                        value: "delete",
                        child: Text("Delete"),
                      ),
                      PopupMenuItem(
                        value: "upload",
                        child: Text("Upload to Cloud"),
                      ),
                    ],
                  ),
                ],
              )
            : PopupMenuButton(
                onSelected: (value) =>
                    _handleSelectNormalMenu(context, value),
                itemBuilder: (context) => const [
                      PopupMenuItem(
                        value: "multiselect",
                        child: Text("Multiselect"),
                      )
                    ]))
      ],
    );
  }

  /// ---------------- BOTTOM ACTION BAR ----------------
  Widget _buildBottomBar() {
    return Obx(() => _controller.multiSelect.value
        ? BottomAppBar(
            color: Colors.pink.shade100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.delete),
                  tooltip: "Delete",
                  onPressed: () {
                    // Delete selected items
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.cloud_upload),
                  tooltip: "Upload to Cloud",
                  onPressed: () {
                    // Upload selected items
                  },
                ),
              ],
            ),
          )
        : const SizedBox.shrink());
  }

  /// ---------------- BODY ----------------
  Widget _buildBody() {
    return Obx(() {
      Widget child;

      switch (_controller.status.value) {
        case WidgetStatus.loading:
          child = Center(
              child: Lottie.asset(
                TLottie.confusedCat,
                key: const ValueKey("loading"),
                width: 200
              )
            );
          break;
        case WidgetStatus.idle:
          if (_controller.animalDrafts.isEmpty) {
            child = const Center(
              key: ValueKey("empty"),
              child: Text("No drafts found"),
            );
          } else {
            child = ListView.builder(
              key: const ValueKey("list"),
              padding: _buildPadding(),
              itemCount: _controller.animalDrafts.length,
              itemBuilder: (context, index) {
                final draft = _controller.animalDrafts[index];
                return AnimalDraftListItem(
                  name: draft.name,
                  timeCreated: draft.updatedAt ?? DateTime.now(),
                  remoteId: draft.remoteId ?? "",
                  species: draft.species,
                  status: draft.status,
                  sex: draft.sex,
                );
              },
            );
          }
          break;
        default:
          child = Center(
            key: const ValueKey("error"),
            child: Text(_controller.errMessage),
          );
      }

      return AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        transitionBuilder: (Widget child, Animation<double> animation) {
          // Example: Fade + Slide from bottom
          final fade = FadeTransition(opacity: animation, child: child);
          final slide = SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 0.1), // small vertical slide
              end: Offset.zero,
            ).animate(animation),
            child: fade,
          );
          return slide;
        },
        child: child,
      );
    });
  }
}
