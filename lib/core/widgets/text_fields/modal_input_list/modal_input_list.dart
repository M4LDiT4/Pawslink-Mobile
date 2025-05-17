
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_template/core/widgets/buttons/add_button.dart';
import 'package:mobile_app_template/core/widgets/containers/generic_expansion_tile.dart';
import 'package:mobile_app_template/core/widgets/text_fields/modal_input_list/modal_input_list_controller.dart';
import 'package:mobile_app_template/core/widgets/text_fields/modal_input_list/modal_input_list_item.dart';
import 'package:mobile_app_template/core/widgets/text_fields/modal_input_list/modals/input_modal_strategy.dart';

class ModalInputList extends StatelessWidget {
  final controller = Get.put<ModalInputListController>(ModalInputListController());
  final InputModalStrategy modal;
  ModalInputList({
    super.key,
    required this.modal
  });


  void showEditorModal (BuildContext context) {
    modal.show(context);
  }
  @override
  Widget build(BuildContext context) {
    return GenericExpansionTile(
      title: "Vaccination History",
      children: [
        Column(
          children: controller.valueList.map((e)=> ModalInputListItemCard(item: e)).toList()
        ),
        AddButton(onPressed: ()=>showEditorModal(context))
      ]
    );
  }
}