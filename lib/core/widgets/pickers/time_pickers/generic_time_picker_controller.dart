import 'package:flutter/material.dart';

class GenericTimePickerController extends ChangeNotifier {
  TimeOfDay? _selectedTime;
  bool _isRequired = false;
  String? _customErrorMssg; //custom error message if needed
  String? _errorMssg; //error message that will be shown if input is invalid

  GenericTimePickerController();

  GenericTimePickerController isRequired(bool flag){
    _isRequired = flag;
    return this;
  }

  GenericTimePickerController initialtime(TimeOfDay? time){
    _selectedTime = time;
    return this;
  }

  GenericTimePickerController customErrorMssg(String? errorMssg){
    _customErrorMssg = errorMssg;
    return this;
  }

  TimeOfDay? get selectedTime => _selectedTime;

  set selectedTime(TimeOfDay? time){
    _selectedTime = time;
    notifyListeners();
  }

  void validate(){
    if(!_isRequired){
      return;
    }
    if(_selectedTime == null){
      _errorMssg = _customErrorMssg ?? "Required";
      notifyListeners();
    } else {
      if(_errorMssg != null){
        _errorMssg = null;
        notifyListeners();
      }
    }
  }

  String? get errorMessage {
    return _errorMssg;
  }


  bool get isValid{
    validate();
    return _errorMssg == null;
  }

  void clear(){
    if(_selectedTime != null){
      _selectedTime = null;
      _errorMssg = null;
      notifyListeners();
    }
  }

  void reset(){
    _selectedTime = null;
    _errorMssg = null;
    notifyListeners();
  }

  int? get selectedTimeInMinutes {
    if (_selectedTime == null) return null;
    return _selectedTime!.hour * 60 + _selectedTime!.minute;
  }
}