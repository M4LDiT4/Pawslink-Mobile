
import 'package:flutter/cupertino.dart';

class GenericDatepickerController extends ChangeNotifier {
  DateTime? _selectedDate;
  String? _errorText;
  String? _errorMssg;
  bool _isRequired = false;

  GenericDatepickerController();

  GenericDatepickerController errorText(String? errorText){
    _errorText = errorText;
    return this;
  }

  GenericDatepickerController isRequired(bool flag){
    _isRequired = flag;
    return this;
  }

  GenericDatepickerController initialDate(DateTime? date){
    _selectedDate = date;
    return this;
  }

  DateTime? get selectedDate => _selectedDate;

  void setDate(DateTime date){
    _selectedDate = date;
    notifyListeners();
  }

  set selectedDate(DateTime? value) {
    if (_selectedDate != value) {
      _selectedDate = value;
      validate();
      notifyListeners();
    }
  }

  void validate(){
    if(!_isRequired){
      return;
    }
    if(_selectedDate == null){
      _errorMssg = _errorText??"Required";
      notifyListeners();
    }else{
      if(_errorMssg !=null){
        _errorMssg = null;
        notifyListeners();
        
      }
    }
  }

  String? getErrorMessage(){
    return _errorMssg;
  }

  bool isValid(){
    validate();
    return _selectedDate != null;
  }

  void clear(){
    _selectedDate = null;
    notifyListeners();
  }

  void reset(){
    _selectedDate = null;
    _errorMssg = null;
  }


}