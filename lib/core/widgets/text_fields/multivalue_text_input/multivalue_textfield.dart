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
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _animationController.forward(); // Animate on entry
  }

  @override
  void dispose() {
    _animationController.dispose(); // No need to reverse here
    super.dispose();
  }

  void handleAdd() {
    widget.buttonAction(widget.index, ActionButtonMode.add);
  }

  void handleDelete() async {
    await _animationController.reverse(); // play exit animation
    widget.buttonAction(widget.index, ActionButtonMode.delete); // actually remove
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
    return FadeTransition( // Optional: remove if you only want scale
      opacity: _animation,
      child: ScaleTransition(
        scale: _animation,
        alignment: Alignment.topLeft, // Smooth entrance from top
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
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
