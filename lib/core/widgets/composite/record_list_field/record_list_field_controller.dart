import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/widgets/composite/record_list_field/record_list_item.dart';

class RecordListFieldController<T> extends ChangeNotifier{

  final List<RecordListItem> _items = [];
  ValueNotifier<int> itemCount = ValueNotifier<int>(0);

  List<T> get items => List.unmodifiable(_items);

  void addItem(RecordListItem item) {
    _items.add(item);
    itemCount.value = items.length;
    notifyListeners();
  }

  void removeItem(int index){
    if(index < _items.length){
      _items.removeAt(index);
      itemCount.value = _items.length;
      notifyListeners();
    }
  }

  void updateItem(RecordListItem item, int index){
    _items[index] = item;
    notifyListeners();
  }
}