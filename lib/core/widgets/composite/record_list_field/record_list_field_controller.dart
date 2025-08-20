import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/enums/widget_status.dart';
import 'package:mobile_app_template/core/widgets/composite/record_list_field/record_list_item.dart';
import 'package:mobile_app_template/domain/entities/base_dto.dart';



class RecordListFieldController extends ChangeNotifier{
  final List<RecordListItem> _items;
  ValueNotifier<int> itemCount = ValueNotifier<int>(0);
  bool _isRequired = false;
  int? _max;
  int? _min;
  String _errMessage = "Minimum number of inputs must be satisfied";
  final String _widgetFullMessage = "Maximum number of elements reached";
  WidgetStatus _status = WidgetStatus.idle;

  RecordListFieldController({
    List<RecordListItem>? initialData
  }): _items = initialData ?? [];

  // ------------------
  // CRUD OPERATIONS
  // ------------------
  void addItem(RecordListItem item) {
    if(_status == WidgetStatus.full){
      return;
    }
    _items.add(item);
    itemCount.value = items.length;
    if(_max != null && itemCount.value == _max){
      _errMessage = "Maximum number of inputs reached";
      _status = WidgetStatus.full;
    }
    notifyListeners();
  }

  void removeItem(int index){
    if(index < _items.length){
      _items.removeAt(index);
      itemCount.value = _items.length;
      if(_status == WidgetStatus.full){
        _status = WidgetStatus.idle;
      }
      notifyListeners();
    }
  }

  List<BaseDto> get value{
    return _items.map((item) => item.data).toList();
  }

  void updateItem(RecordListItem item, int index){
    _items[index] = item;
    notifyListeners();
  }

  // ------------------
  // UTILS
  // ------------------

  bool isValid(){
    // if not required, empty list is okay
    if(! _isRequired){
      return true;
    }
    if(_min != null && _max == null){
      return itemCount.value >= _min!;
    }
    else if(_max != null && _min == null){
      return itemCount.value <= _max!;
    }
    else if(_min != null && _max != null){
      return itemCount.value <= _max! && itemCount.value >= _min!;
    }
    else{
      return items.isNotEmpty;
    }
  }

  bool validate(){
    final valid = isValid();
    if(!isValid()){
      _status = WidgetStatus.error;
    }else{
      if(_status == WidgetStatus.error){
        _status = WidgetStatus.idle;
      }
    }
    notifyListeners();
    return valid;
  }

  // ------------------
  // SETTERS
  // ------------------

  set max(int? maxCount){
    _max = maxCount;
  }

  set min (int? minCount){
    _min = minCount;
  }

  set isRequired(bool required){
    _isRequired = required;
  }

  set errMessage(String? message){
    if(message != null){
      _errMessage = message;
    }
  }

  // ---------------------
  // GETTERS
  // ---------------------
  

  List get items => List.unmodifiable(_items);
  WidgetStatus get status{
    return _status;
  }

  String get errMessage{
    return _errMessage;
  }

  String get widgetFullMessage{
    return _widgetFullMessage;
  }

  List<BaseDto> getValues(){
    return _items.map((item) => item.data).toList();
  }
}