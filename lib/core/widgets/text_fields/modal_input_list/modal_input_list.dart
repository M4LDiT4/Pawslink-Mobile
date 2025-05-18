
import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/widgets/buttons/add_button.dart';
import 'package:mobile_app_template/core/widgets/containers/generic_expansion_tile.dart';
import 'package:mobile_app_template/core/widgets/text_fields/modal_input_list/modal_input_list_controller.dart';
import 'package:mobile_app_template/core/widgets/text_fields/modal_input_list/modal_input_list_item.dart';
import 'package:mobile_app_template/core/widgets/text_fields/modal_input_list/modals/input_modal_strategy.dart';

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
    return GenericExpansionTile(
      title: widget.title,
      children: [
        AnimatedBuilder(
          animation: _controller, 
          builder: (context, _) => Column(
            children: _buildListItems()
          ),
        ),
        AddButton(onPressed: ()=>showEditorModal(context))
      ]
    );
  }
}