import 'package:flutter/material.dart';

class TagInputController extends ChangeNotifier {
  final List<String> _items = [];
  final TextEditingController textinputController = TextEditingController();

  List<String> get items => List.unmodifiable(_items);

  final ValueNotifier<int> itemCount = ValueNotifier<int>(0);

  void addItem() {
    final item = textinputController.text.trim();
    if (item.isNotEmpty) {
      _items.add(item);
      itemCount.value = items.length;
      textinputController.clear();
      notifyListeners();
    }
  }

  void removeItem(int index) {
    if (index < _items.length) {
      _items.removeAt(index);
      itemCount.value = items.length;
      notifyListeners();
    }
  }

  void clearInput() {
    textinputController.clear();
  }
}
