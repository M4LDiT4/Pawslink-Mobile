
import 'package:flutter/material.dart';

abstract class InputModalStrategy {
  String label;
  VoidCallback? callback;

  InputModalStrategy({
    required this.label,
    this.callback,
  });

  void show(BuildContext context);
  Widget build(BuildContext context);

  InputModalStrategy setCallback(VoidCallback callback);
}
