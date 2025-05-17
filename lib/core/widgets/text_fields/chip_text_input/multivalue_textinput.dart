import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_template/core/widgets/text_fields/chip_text_input/multivalue_textfield.dart';
import 'package:mobile_app_template/core/widgets/text_fields/chip_text_input/multivalue_textinput_controller.dart';

class MultivalueTextInput extends StatelessWidget {
  final MultiValueTextfieldController controller;
  const MultivalueTextInput({
    super.key,
    required this.controller,
  });

  List<Widget> _generateInputFields(List<TextEditingController> controllers){
    final length = controller.getvalueListCount();
    if(length == 0 ){
      return [
        ElevatedButton(
            onPressed: (){controller.handleButtonPress(0, ActionButtonMode.add);}, 
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add),
                Text("Add")
              ],
            )
        )
      ];
    }
    return controllers.asMap().entries.map((el){
      return MultiValueTextfield(
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
