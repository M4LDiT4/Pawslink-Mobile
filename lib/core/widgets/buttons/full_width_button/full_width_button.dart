import 'package:flutter/material.dart';

class FullWidthButton extends StatelessWidget {
  final List<Widget> children;
  final VoidCallback onPressed;
  const FullWidthButton({
    super.key,
    required this.children,
    required this.onPressed,
  });


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, 
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      )
    );
  }
}