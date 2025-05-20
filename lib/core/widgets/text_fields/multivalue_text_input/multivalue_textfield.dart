import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/widgets/text_fields/multivalue_text_input/trailing_button.dart';
import 'package:mobile_app_template/core/widgets/text_fields/generic_text_field/generic_textfield_builder.dart';
import 'package:mobile_app_template/core/widgets/ui_utils/fixed_seperator.dart';

enum ActionButtonMode { add, delete }

class MultiValueTextfield extends StatefulWidget {
  final TextEditingController controller;
  final bool isLast;
  final int index;
  final void Function(int index, ActionButtonMode mode) buttonAction;

  const MultiValueTextfield({
    super.key,
    required this.controller,
    required this.isLast,
    required this.buttonAction,
    required this.index,
  });

  @override
  State<MultiValueTextfield> createState() => _MultiValueTextfieldState();
}

class _MultiValueTextfieldState extends State<MultiValueTextfield>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );

    _fadeController.forward(); // Animate on entry
  }

  @override
  void dispose() {
    _fadeController.reverse(); // Animate out
    _fadeController.dispose();
    super.dispose();
  }

  void handleAdd() {
    widget.buttonAction(widget.index, ActionButtonMode.add);
  }

  void handleDelete() {
    widget.buttonAction(widget.index, ActionButtonMode.delete);
  }

  Widget _renderTrailingButtons() {
    if (widget.isLast) {
      return Row(
        children: [
          TrailingButton(onPress: handleDelete, mode: ActionButtonMode.delete),
          const FixedSeparator(space: 8, orientation: SeparatorOrientation.horizontal),
          TrailingButton(onPress: handleAdd, mode: ActionButtonMode.add),
        ],
      );
    }
    return TrailingButton(onPress: handleDelete, mode: ActionButtonMode.delete);
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _fadeAnimation,
      axis: Axis.vertical,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Row(
          children: [
            GenericTextfieldBuilder()
                .clearButton(true)
                .controller(widget.controller)
                .focusOnCreate(true)
                .build(),
            _renderTrailingButtons(),
          ],
        ),
      ),
    );
  }
}
