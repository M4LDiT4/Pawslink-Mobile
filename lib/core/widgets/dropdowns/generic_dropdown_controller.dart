
import 'package:flutter/material.dart';
class GenericDropdownController extends ChangeNotifier {
  String? _selectedValue;

  GenericDropdownController({String? selectedValue}) {
    _selectedValue = selectedValue;
  }

  GenericDropdownController initialValue(String? initialValue){
    _selectedValue = initialValue;
    return this;
  }

  String? get selectedValue => _selectedValue;

  set selectedValue(String? value) {
    if (_selectedValue != value) {
      _selectedValue = value;
      notifyListeners(); // Notify listeners of the change
    }
  }

  void reset() {
    _selectedValue = null;
    notifyListeners();
  }
}
