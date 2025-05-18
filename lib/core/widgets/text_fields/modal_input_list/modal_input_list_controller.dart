
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ModalInputListItem {
  final String title;
  final String subtitle;

  ModalInputListItem({
    required this.title,
    required this.subtitle
  });


  String getTitle(){
    return title;
  }

  String getSubTitle(){
    return subtitle;
  }
}

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
}

