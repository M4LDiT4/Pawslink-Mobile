
import 'package:flutter/cupertino.dart';

class GenericDatepickerController extends ChangeNotifier {
  DateTime? _selectedDate;
  String? _errorText;
  String? _errorMssg;
  bool _isRequired = false;

  GenericDatepickerController({
    DateTime? initialDate
  }){
    _selectedDate = initialDate;
  }

  GenericDatepickerController errorText(String? errorText){
    _errorText = errorText;
    return this;
  }

  GenericDatepickerController isRequired(bool flag){
    _isRequired = flag;
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

  bool validate(){
    bool valid = isValid;
    if(valid){
      _errorMssg = null;
    } else {
      _errorMssg = _errorText ?? "Invalid date";
    }
    notifyListeners();
    return valid;
  }

  String? getErrorMessage(){
    return _errorMssg;
  }

  bool get isValid{
    if(!_isRequired){
      return true;
    }
    return _selectedDate != null;
  }

  void clear(){
    _selectedDate = null;
    notifyListeners();
  }

  void reset(){
    _selectedDate = null;
    _errorMssg = null;
    notifyListeners();
  }


}