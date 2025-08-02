import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class GenericImgPickerController extends ChangeNotifier {
  XFile? _selectedImage;


  GenericImgPickerController();

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

  XFile? get selectedImage => _selectedImage;

}