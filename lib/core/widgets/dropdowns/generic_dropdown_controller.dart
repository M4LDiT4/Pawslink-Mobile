import 'package:flutter/material.dart';

class GenericDropdownController<T extends Enum> extends ChangeNotifier {
  T? _selectedValue;

  GenericDropdownController({T? selectedValue}) {
    _selectedValue = selectedValue;
  }

  GenericDropdownController<T> initialValue(T? initialValue) {
    _selectedValue = initialValue;
    return this;
  }

  T? get selectedValue => _selectedValue;

  set selectedValue(T? value) {
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
