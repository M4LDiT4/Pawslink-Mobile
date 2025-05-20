
import 'package:flutter/widgets.dart';
import 'package:mobile_app_template/data/model/modal_input_list_item.dart';

class ModalInputListController extends ChangeNotifier{
  final List<ModalInputListItem> _valueList = [];

  List<ModalInputListItem> get valueList => List.unmodifiable(_valueList);

  void addItem(ModalInputListItem item){
    _valueList.add(item);
    notifyListeners();
  }

  void removeItem(int index){
    if(index < _valueList.length){
      _valueList.removeAt(index);
      notifyListeners();
    }
  }

  void clear(){
    _valueList.clear();
    notifyListeners();
  }

  List<String> getValueInString(){
    final List<String> stringList = [];
    for(var item in _valueList){
      stringList.add(item.getValueInString());
    }

    return stringList;
  }
}

