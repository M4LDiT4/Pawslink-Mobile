import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';

class ImgPickerSrcSelectionBttn extends StatelessWidget {
  final IconData icon;
  final VoidCallback handlePress;

  const ImgPickerSrcSelectionBttn({
    super.key,
    required this.icon,
    required this.handlePress,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(TSizes.paddingmd),
          ),
          onPressed: handlePress,
          child: Icon(
            icon,
            size: TSizes.iconxl,
          ),
        ),
      ),
    );
  }
}
