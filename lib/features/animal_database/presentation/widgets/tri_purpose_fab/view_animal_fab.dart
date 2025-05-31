
import 'package:flutter/material.dart';

class ViewAnimalFab extends StatelessWidget {
  final VoidCallback callback;
  final Widget child;
  const ViewAnimalFab({
    super.key,
    required this.callback,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      heroTag: 'sort',
      onPressed: callback,
      child: child, // Replace with your Image.asset if needed
    );
  }
}