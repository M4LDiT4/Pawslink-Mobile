
import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/widgets/text_fields/modal_input_list/modal_input_list_controller.dart';

abstract class InputModalStrategy {
  String label;
  void Function(ModalInputListItem item)? callback;

  InputModalStrategy({
    required this.label,
    this.callback,
  });

  void show(BuildContext context);
  Widget build(BuildContext context);

  InputModalStrategy setCallback(void Function(ModalInputListItem item) callback);
}
