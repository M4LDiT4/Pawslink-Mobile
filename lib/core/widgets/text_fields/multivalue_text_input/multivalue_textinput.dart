import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/widgets/buttons/add_button.dart';
import 'package:mobile_app_template/core/widgets/text_fields/multivalue_text_input/multivalue_textfield.dart';
import 'package:mobile_app_template/core/widgets/text_fields/multivalue_text_input/multivalue_textinput_controller.dart';

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
        const Padding(
          padding: EdgeInsets.symmetric(vertical: TSizes.paddingsm),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("No Record")
            ],
          ),
        ),
        AddButton(
          onPressed: (){
            controller.handleButtonPress(0, ActionButtonMode.add);
            }
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
    return AnimatedBuilder(
      animation: controller, 
      builder: (context, _) => Column(
      children: [
        const Divider(),
        ..._generateInputFields(controller.getValues())
        ],
      )
    );
  }
}
