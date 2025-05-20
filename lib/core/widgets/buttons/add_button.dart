
import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/widgets/buttons/full_width_button/full_width_button.dart';

class AddButton extends StatelessWidget {
  final VoidCallback onPressed;
  const AddButton({
    super.key,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return FullWidthButton(
      onPressed: onPressed,
      children: const [Icon(Icons.add), Text("Add")]
    );
  }
}