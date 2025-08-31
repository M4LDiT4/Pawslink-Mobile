import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_template/core/enums/animal_sex.dart';
import 'package:mobile_app_template/core/enums/animal_species.dart';
import 'package:mobile_app_template/core/enums/animal_status.dart';
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

  void _handleSelectNormalMenu(BuildContext context, String value){
    if(value == "multiselect"){
      _controller.multiSelect.value = true;
    }
  }

    /// ---------------- BUILD ----------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  /// ---------------- APP BAR ----------------
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          if (_controller.multiSelect.value) {
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
                      // Select all logic
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    tooltip: "Cancel Selection",
                    onPressed: () {
                      _controller.multiSelect.value = false;
                      _controller.selectedIdList.clear();
                    },
                  ),
                  PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == "delete") {
                        // delete logic
                      } else if (value == "export") {
                        // export logic
                      }
                    },
                    itemBuilder: (context) => const [
                      PopupMenuItem(
                        value: "delete",
                        child: Text("Delete"),
                      ),
                      PopupMenuItem(
                        value: "export",
                        child: Text("Export"),
                      ),
                    ],
                  ),
                ],
              )
            : PopupMenuButton(
              onSelected: (value) => _handleSelectNormalMenu(context, value),
              itemBuilder: (context) => const [
                  PopupMenuItem(
                    value: "multiselect",
                    child: Text("Multiselect")
                  )
                ]
              )
        )
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
                  icon: const Icon(Icons.archive),
                  tooltip: "Archive",
                  onPressed: () {
                    // Archive selected items
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.share),
                  tooltip: "Share",
                  onPressed: () {
                    // Share selected items
                  },
                ),
              ],
            ),
          )
        : const SizedBox.shrink());
  }

  /// ---------------- BODY ----------------
  Widget _buildBody() {
    return Obx(
      () => SingleChildScrollView(
        padding: _buildPadding(),
        child: Column(
          children: [
            AnimalDraftListItem(
              name: "Sample animal",
              timeCreated: DateTime.now(),
              remoteId: "",
              species: AnimalSpecies.dog,
              status: AnimalStatus.owned,
              sex: AnimalSex.female,
            ),
          ],
        ),
      ),
    );
  }

}
