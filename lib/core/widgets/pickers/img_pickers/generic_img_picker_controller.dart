import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_app_template/core/enums/widget_status.dart';

class GenericImgPickerController extends ChangeNotifier {

  late bool _isRequired = false;
  String _errorMssg = "Required";
  XFile? _selectedImage;
  WidgetStatus _status = WidgetStatus.idle;

  GenericImgPickerController setInitialValue(XFile? imgFile){
    _selectedImage = imgFile;
    return this;
  }
  set selectedImage (XFile? imgFile){
    _selectedImage = imgFile;
    notifyListeners();
  }

  void clearImage() {
    _selectedImage = null;
    notifyListeners();
  }

  bool isValid(){
    if(!_isRequired){
      return true;
    }
    return _selectedImage != null;
  }

  bool validate(){
    bool valid = isValid();
    if(valid){
      _status = WidgetStatus.valid;
    }else{
      _status = WidgetStatus.error;
    }
    notifyListeners();
    return valid;
  }

  set isRequired (bool isRequired){
    _isRequired = isRequired;
  }

  set errorMessage (String message){
    _errorMssg = errorMessage;
  }

  XFile? get selectedImage => _selectedImage;

  String get errorMessage => _errorMssg;

  WidgetStatus get status => _status; 
}