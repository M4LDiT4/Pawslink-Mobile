import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/enums/widget_status.dart';
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
  final int? min;
  final String? errMessage;
  final IconData? icon;

  const RecordListField({
    required this.form,
    this.controller,
    required this.title,
    this.isRequired = false,
    this.max,
    this.min,
    this.errMessage,
    this.icon,
    super.key,
  });

  @override
  State<RecordListField> createState() => _RecordListFieldState();
}

class _RecordListFieldState extends State<RecordListField> {
  late final RecordListFieldController _controller;

  @override
  void initState() {
    super.initState();
    final ctrl = widget.controller ?? RecordListFieldController();
    ctrl.max = widget.max;
    ctrl.min = widget.min;
    ctrl.errMessage = widget.errMessage;
    _controller = ctrl;
  }

  // -------------------------------
  // Helpers
  // -------------------------------

  bool _isEnough(int count) {
    if (!widget.isRequired) return true;
    if (widget.max == null) return count != 0;
    return count >= widget.max!;
  }

  Future<void> _showForm() async {
    final response = await TUIHelpers.showResponsiveModal<RecordListItem>(
      child: widget.form,
    );
    if (response != null) {
      _controller.addItem(response);
    }
  }

  Future<void> _editItem(RecordListItem item, int index) async {
    final response = await TUIHelpers.showResponsiveModal<RecordListItem>(
      child: widget.form,
      arguments: item,
    );
    if (response != null) {
      _controller.updateItem(item, index);
    }
  }

  // -------------------------------
  // Main Build
  // -------------------------------

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(context),
        const SizedBox(height: 8),
        _buildList(),
        const SizedBox(height: 8),
        _buildAddButton(context),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Text(
                widget.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            ValueListenableBuilder<int>(
              valueListenable: _controller.itemCount,
              builder: (_, count, __) => _buildCounter(count),
            ),
          ],
        ),
        AnimatedBuilder(
          animation: _controller, 
          builder: (context, child) {
            if(_controller.status == WidgetStatus.error){
              return Text(
                style: const TextStyle(
                  color: TColors.error,
                  fontWeight: FontWeight.bold
                ),
                _controller.errMessage
              );
            }
            return const SizedBox.shrink();
          }
        )
      ],
    );
  }

  Widget _buildCounter(int count) {
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
  }

  Widget _buildList() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) => ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _controller.items.length,
        itemBuilder: (_, index) {
          final item = _controller.items[index];
          return RecordListTile(
            item: item,
            deleteFunction: () => _controller.removeItem(index),
            editFunction: () => _editItem(item, index),
            leadingIcon: widget.icon,
          );
        },
      ),
    );
  }

  Widget _buildAddButton(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
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
        AnimatedBuilder(
          animation: _controller, 
          builder: (context, child){
            if(_controller.status == WidgetStatus.full){
              return Text(
                style: const TextStyle(
                  color: TColors.warning,
                  fontWeight: FontWeight.bold
                ),
                _controller.widgetFullMessage
              );
            }
            return const SizedBox.shrink();
          }
        )
      ],
    );
  }
}
