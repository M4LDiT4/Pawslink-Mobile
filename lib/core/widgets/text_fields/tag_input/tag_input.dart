import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app_template/core/widgets/text_fields/tag_input/tag_input_controller.dart';

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
    this.isRequired = false,
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
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    if (!_focusNode.hasFocus) {
      setState(() => _showTextInput = false);
    }
  }

  bool _isEnough(int  count) {
    if (!widget.isRequired) return true;
    if (widget.max == null) return count != 0;
    return count >= widget.max!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(context),
        const SizedBox(height: 8),
        _buildChips(), // rebuilds only when items change
        const SizedBox(height: 8),
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


  /// -------------------------------
  /// SECTION 2: Chips List
  /// -------------------------------
  Widget _buildChips() {
    return AnimatedBuilder(
      animation: _controller, // listens for notifyListeners()
      builder: (_, __) {
        return Wrap(
          spacing: 8,
          runSpacing: 4,
          children: _controller.items.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;

            return Chip(
              label: Text(item),
              onDeleted: () => _controller.removeItem(index),
              deleteIconColor: Colors.red,
            );
          }).toList(),
        );
      },
    );
  }



  /// -------------------------------
  /// SECTION 3: Input / Add Button
  /// -------------------------------
  Widget _buildInputOrAddButton(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 300),
      crossFadeState: _showTextInput
          ? CrossFadeState.showSecond
          : CrossFadeState.showFirst,
      firstChild: SizedBox(
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
          onPressed: () => setState(() => _showTextInput = true),
          child: const Text("+ Add"),
        ),
      ),
      secondChild: _buildTextFormField(),
    );
  }

  /// -------------------------------
  /// SECTION 4: Text Field + Actions
  /// -------------------------------
  Widget _buildTextFormField() {
    return Row(
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
            _controller.clearInput();
            setState(() => _showTextInput = false);
          },
          icon: const Icon(Iconsax.close_circle),
        ),
        IconButton(
          onPressed: _controller.addItem,
          icon: const Icon(Iconsax.add_circle),
        ),
      ],
    );
  }

}
