import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_template/core/widgets/text_fields/chip_text_input/chip_textfield.dart';
import 'package:mobile_app_template/core/widgets/text_fields/chip_text_input/chip_textinput_controller.dart';

class ChipInput extends StatelessWidget {
  ChipInput({super.key});

  final controller = Get.put<ChipTextinputController>(ChipTextinputController());

  List<Widget> _generateInputFields(List<TextEditingController> controllers){
    final length = controller.getvalueListCount();
    return controllers.asMap().entries.map((el){
      return ChipTextfield(
        controller: el.value, isLast: el.key == length-1, 
        buttonAction: controller.handleButtonPress, 
        index: el.key
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(()=> Column(
      children: _generateInputFields(controller.getValues()),
      )
    );
  }
}
