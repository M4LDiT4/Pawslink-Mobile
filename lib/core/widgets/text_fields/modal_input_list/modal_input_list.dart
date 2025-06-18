
import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/utils/device/device_utility.dart';
import 'package:mobile_app_template/core/widgets/text_fields/modal_input_list/modal_input_list_controller.dart';
import 'package:mobile_app_template/core/widgets/text_fields/modal_input_list/modal_input_list_item.dart';
import 'package:mobile_app_template/core/widgets/text_fields/modal_input_list/modals/input_modal_strategy.dart';
import 'package:mobile_app_template/core/widgets/text_fields/multivalue_text_input/multivalue_textfield.dart';
import 'package:mobile_app_template/core/widgets/text_fields/multivalue_text_input/trailing_button.dart';

class ModalInputList extends StatefulWidget {
  final InputModalStrategy modal;
  final ModalInputListController? controller;
  final String title;
  final IconData? icon;
  const ModalInputList({
    super.key,
    required this.modal,
    this.controller,
    required this.title,
    this.icon,
  });
  @override
  State<ModalInputList> createState() => _ModalInputListState();
}

class _ModalInputListState extends State<ModalInputList> {
  late ModalInputListController _controller;
  late InputModalStrategy _modal;

  void showEditorModal(BuildContext context){
    _modal.show(context);
  }
  @override 
  void initState() {
    _controller = widget.controller ?? ModalInputListController();
    _modal = widget.modal.setCallback(_controller.addItem);
    super.initState();
  }

  List<Widget> _buildListItems(){
    if(_controller.valueList.isEmpty){
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
    final widgetList = <Widget>[];
    for(int i = 0; i < _controller.valueList.length ; i++){
      widgetList.add(ModalInputListItemCard(
        item: _controller.valueList[i],
        onPressed: () => {_controller.removeItem(i)},
        icon: widget.icon,
      ));
    }
    return widgetList;
  }
  @override
  Widget build(BuildContext context) {
    final isDarkMode = TDeviceUtils.isDarkMode();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: isDarkMode? TColors.primaryDark : TColors.primary
              ),
              widget.title
            ),
            TrailingButton(onPress: ()=>showEditorModal(context), mode: ActionButtonMode.add)
          ],
        ),
        AnimatedBuilder(
          animation: _controller, 
          builder: (context, _) => Column(
            children: [
              ..._buildListItems(),
            ],
          ),
        ),
        const Divider()
      ]
    );
  }
}