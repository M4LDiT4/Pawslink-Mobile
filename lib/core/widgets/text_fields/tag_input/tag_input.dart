import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app_template/core/widgets/text_fields/tag_input/tag_input_controller.dart';
import 'package:mobile_app_template/core/widgets/ui_utils/fixed_seperator.dart';

class TagInput extends StatefulWidget {
  final TagInputController? controller;
  final String title;
  final bool isRequired;
  final int? max;

  const TagInput({
    super.key, 
    required this.title,
    this.controller,
    this.max,
    this.isRequired = false
  });

  @override
  State<TagInput> createState() => _TagInputState();
}

class _TagInputState extends State<TagInput> {
  late final TagInputController _controller;
  late final FocusNode _focusNode;
  bool _showTextInput = false;

  @override
  void initState() {
    _controller = widget.controller ?? TagInputController();
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
    _focusNode.dispose();
  }

  void _handleFocusChange() {
    if (!_focusNode.hasFocus) {
      // TextField lost focus → hide it
      setState(() {
        _showTextInput = false;
      });
    }
  }

  bool _isEnough(){
    if(!widget.isRequired){
      return true;
    }
    if(widget.max == null){
      return _controller.items.isNotEmpty;
    }
    return _controller.items.length >= widget.max!;
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(context),
        const FixedSeparator(space: 8),
        _buildChips(),
        const FixedSeparator(space: 8),
        _buildInputOrAddButton(context),
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
              color: Theme.of(context).colorScheme.primary
            ),
          ),
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: _controller.items.length.toString(),
                style: TextStyle(
                  color: _isEnough()? Colors.green: Colors.red , 
                  fontWeight: FontWeight.bold
                ),
              ),
               TextSpan(
                text: " / ${widget.max != null ? widget.max.toString(): "--" }",
              ),
            ],
          ),
          style: const TextStyle(fontSize: 16), // default style
        )
      ],
    );
  }

  /// -------------------------------
  /// SECTION 2: Chips List
  /// -------------------------------
  Widget _buildChips() {
    return Wrap(
      spacing: 8,
      runSpacing: 4,
      children: [
        ..._controller.items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;

          return Chip(
            label: Text(item),
            onDeleted: () {
              setState(() => _controller.items.removeAt(index));
            },
          );
        }),
      ],
    );
  }

  /// -------------------------------
  /// SECTION 3: Input / Add Button
  /// -------------------------------
  Widget _buildInputOrAddButton(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: _showTextInput
          ? _buildTextFormField()
          : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
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
                    onPressed: () => setState(() => _showTextInput = true),
                    child: const Text("+ Add"),
                  ),
              ),
            ],
          ),
    );
  }

  /// -------------------------------
  /// SECTION 4: Text Field + Actions
  /// -------------------------------
  Widget _buildTextFormField() {
    return Row(
      key: const ValueKey("text_input"),
      children: [
        Expanded(
          child: TextFormField(
            focusNode: _focusNode,
            autofocus: true,
            controller: _controller.textinputController,
            decoration: const InputDecoration(
              hintText: "Enter tag",
            ),
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          onPressed: () {
            _controller.clear();
            setState(() => _showTextInput = false);
          },
          icon: const Icon(Iconsax.close_circle),
        ),
        IconButton(
          onPressed: _addTag,
          icon: const Icon(Iconsax.add_circle),
        ),
      ],
    );
  }

  /// -------------------------------
  /// HELPER: Add a tag
  /// -------------------------------
  void _addTag() {
    setState(() {
      _controller.addItem();
    });
    _controller.clear();
  }
}
