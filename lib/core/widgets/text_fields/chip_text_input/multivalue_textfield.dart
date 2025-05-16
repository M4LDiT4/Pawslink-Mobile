
import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/widgets/text_fields/chip_text_input/trailing_button.dart';
import 'package:mobile_app_template/core/widgets/text_fields/generic_text_field/generic_textfield_builder.dart';
import 'package:mobile_app_template/core/widgets/ui_utils/fixed_seperator.dart';

enum ActionButtonMode {add, delete}

class MultiValueTextfield extends StatelessWidget {
  final TextEditingController controller;
  final bool isLast;
  final int index;
  final void Function (int index, ActionButtonMode mode) buttonAction; 
  

  const MultiValueTextfield({
    super.key,
    required this.controller,
    required this.isLast,
    required this.buttonAction,
    required this.index,
  });

  void handleAdd(){
    buttonAction(index, ActionButtonMode.add);
  }

  void handleDelete(){
    buttonAction(index, ActionButtonMode.delete);
  }

  Widget _renderTrailingButtons(){
    if(isLast){
      return Row(
        children: [
          TrailingButton(onPress: handleDelete, mode: ActionButtonMode.delete,),
          const FixedSeparator(space: 8,orientation:  SeparatorOrientation.horizontal),
          TrailingButton(onPress: handleAdd, mode: ActionButtonMode.add)
        ],
      );
    }
    return TrailingButton(onPress: handleDelete, mode: ActionButtonMode.delete);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GenericTextfieldBuilder()
        .clearButton(true)
        .controller(controller)
        .focusOnCreate(true)
        .build(),
        _renderTrailingButtons()
      ],
    );
  }
}