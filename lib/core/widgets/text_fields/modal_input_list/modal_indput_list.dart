
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_template/core/widgets/containers/generic_expansion_tile.dart';
import 'package:mobile_app_template/core/widgets/text_fields/modal_input_list/modal_input_list_controller.dart';
import 'package:mobile_app_template/core/widgets/text_fields/modal_input_list/modal_input_list_item.dart';

class ModalIndputList extends StatelessWidget {
  final controller = Get.put<ModalInputListController>(ModalInputListController());
  ModalIndputList({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericExpansionTile(
      title: "Vaccination History",
      children: [
        Column(
          children: controller.valueList.map((e)=> ModalInputListItemCard(item: e)).toList()
        ),
        ElevatedButton(
          onPressed: (){}, 
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.add), Text("Add")],
          )
        )
      ]
    );
  }
}