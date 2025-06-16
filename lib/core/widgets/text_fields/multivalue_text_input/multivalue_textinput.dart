import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/utils/device/device_utility.dart';
import 'package:mobile_app_template/core/widgets/text_fields/multivalue_text_input/multivalue_textfield.dart';
import 'package:mobile_app_template/core/widgets/text_fields/multivalue_text_input/multivalue_textinput_controller.dart';
import 'package:mobile_app_template/core/widgets/text_fields/multivalue_text_input/trailing_button.dart';

class MultivalueTextInput extends StatelessWidget {
  final MultiValueTextfieldController controller;
  final String title;
  const MultivalueTextInput({
    super.key,
    required this.controller,
    required this.title,
  });

  List<Widget> _generateInputFields(List<TextEditingController> controllers, BuildContext context, bool isDarkMode){
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
  Widget? _renderAddButton(){
    if(controller.getvalueListCount() == 0){
      return TrailingButton(
        onPress: ()=>controller.handleButtonPress(0, ActionButtonMode.add), 
        mode: ActionButtonMode.add
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = TDeviceUtils.isDarkMode();
    return 
    AnimatedBuilder(
      animation: controller, 
      builder: (context, _) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: isDarkMode? TColors.primaryDark : TColors.primary
                ),
                title
              ),
              _renderAddButton() ?? const SizedBox.shrink()
            ],
          ),
          ..._generateInputFields(controller.getValues(), context, isDarkMode),
          const Divider(),
        ],
      )
    );
  }
}
