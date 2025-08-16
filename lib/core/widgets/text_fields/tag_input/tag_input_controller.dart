import 'package:flutter/material.dart';

class TagInputController extends ChangeNotifier {
  final List<String> _items = [];
  final TextEditingController textinputController = TextEditingController();

  void addItem(){
    final item = textinputController.text;
    if(item.isNotEmpty){
      _items.add(item);
      textinputController.clear();
      notifyListeners();
    }
  }

  void clear(){
    textinputController.clear();
  }
  set removeItem(int index){
    if(index < items.length){
      _items.removeAt(index);
      notifyListeners();
    }else{
      throw Exception("Error removing item at index $index as the number of items is only ${_items.length}");
    }
  }
  List<String> get items => _items;
}