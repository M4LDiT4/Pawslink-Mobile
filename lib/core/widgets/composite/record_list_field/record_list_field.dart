import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/utils/helpers/ui_helpers.dart';
import 'package:mobile_app_template/core/widgets/composite/record_list_field/record_list_field_controller.dart';
import 'package:mobile_app_template/core/widgets/composite/record_list_field/record_list_item.dart';
import 'package:mobile_app_template/core/widgets/composite/record_list_field/record_list_tile.dart';

class RecordListField extends StatefulWidget {
  final RecordListFieldController? controller;
  final Widget form;
  final String title;
  final bool isRequired;
  final int? max;
  const RecordListField({
    required this.form,
    this.controller,
    required this.title,
    this.isRequired = false,
    this.max,
    super.key
  });

  @override
  State<RecordListField> createState() => _RecordListFieldState();
}

class _RecordListFieldState extends State<RecordListField> {
  late final RecordListFieldController _controller;

  @override
  void initState(){
    super.initState();
    _controller = widget.controller ?? RecordListFieldController();
  }

  bool _isEnough(int  count) {
    if (!widget.isRequired) return true;
    if (widget.max == null) return count != 0;
    return count >= widget.max!;
  }
  void _showForm() async{
    final response = await TUIHelpers.showResponsiveModal<RecordListItem>(
      child: widget.form
    );
    if(response != null){
      _controller.addItem(response);
    }
  }

  void _editItem(RecordListItem item, int index) async{
    final response = await TUIHelpers.showResponsiveModal<RecordListItem>(
      child: widget.form,
      arguments:  item
    );

    if(response != null){
      _controller.updateItem(item, index);
    }
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        // title
        _buildHeader(context),
        // list of inputs
        AnimatedBuilder(
          animation: _controller, 
          builder: (_, __){
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _controller.items.length,
              itemBuilder:  (_, index){
                final item = _controller.items[index];
                return RecordListTile(
                  item: item,
                  deleteFunction: () => _controller.removeItem(index),
                  editFunction: () => _editItem(item, index),
                );
              }
            );
          }
        ),
        // add button
        SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: theme.colorScheme.primary,
            side: BorderSide(
              color: theme.colorScheme.primary,
              width: 2,
            ),
            padding: const EdgeInsets.all(8),
          ),
          onPressed: _showForm,
          child: const Text("+ Add"),
        ),
      ),
      ],
    );
  }

  /// -------------------------------
  /// SECTION 1: Title + Counter
  /// -------------------------------
  Widget _buildHeader(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Text(
            widget.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        ValueListenableBuilder<int>(
          valueListenable: _controller.itemCount, // a ValueNotifier<int>
          builder: (_, count, __) {
            return Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: count.toString(),
                    style: TextStyle(
                      color: _isEnough(count) ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: " / ${widget.max ?? "--"}",
                  ),
                ],
              ),
              style: const TextStyle(fontSize: 16),
            );
          },
        ),
      ],
    );
  }
}

