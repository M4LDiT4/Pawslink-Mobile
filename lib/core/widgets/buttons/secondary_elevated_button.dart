import 'package:flutter/material.dart';

class SecondaryElevatedButton extends StatelessWidget {
  
  final void Function() onPressed;
  final Widget child;
  const SecondaryElevatedButton({
    super.key,
    required this.onPressed,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.primary,
        side: BorderSide(
          color: Theme.of(context).colorScheme.primary,
          width: 2
        ),
      ),
      onPressed: onPressed , 
      child: child
    );
  }
}