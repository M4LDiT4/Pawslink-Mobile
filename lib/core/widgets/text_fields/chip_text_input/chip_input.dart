import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_template/core/widgets/text_fields/chip_text_input/chip_textinput_controller.dart';
import 'package:mobile_app_template/core/widgets/text_fields/chip_text_input/textinput_add_button.dart';

class ChipInput extends StatelessWidget {
  const ChipInput({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<ChipTextinputController>(ChipTextinputController());
    final textController = TextEditingController();

    void submitInput(){
      if(textController.text.isNotEmpty){
        controller.insertValue(textController.text);
        textController.text ="";
      }
    }
    return Column(
      children: [
        Obx(()=> Wrap(
          children: controller.getValues().map((item) => Chip(label: Text(item))).toList(),
          ) 
        ),
        TextFieldWithPlusButton(
          label: "New Coat Color",
          onSubmit: submitInput,
          controller: textController,
        )
      ],
    );
  }
}
