import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/widgets/text_fields/generic_text_field.dart';

class TextFieldWithPlusButton extends StatelessWidget {
  final String label;
  final VoidCallback onSubmit;
  final TextEditingController? controller;

  const TextFieldWithPlusButton({
    super.key,
    required this.onSubmit,
    required this.label,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      GenericTextField(
        labelText: label,
        controller: controller,
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,       // No inner padding
          minimumSize: Size.zero,         // No default minimum width/height
          tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Tight touch area
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(TSizes.borderRadiussm)
          ),
        ),
        onPressed: onSubmit, 
        child: const Icon( 
          size: TSizes.iconxxl,
          Iconsax.add
        )
      )
    ],
    );
  }
}