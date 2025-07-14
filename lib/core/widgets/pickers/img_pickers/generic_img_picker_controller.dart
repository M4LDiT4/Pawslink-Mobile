
import 'dart:io';

import 'package:flutter/widgets.dart';

class GenericImgPickerController extends ChangeNotifier {
  File? _selectedImage;


  GenericImgPickerController();

  GenericImgPickerController setInitialValue(File? imgFile){
    _selectedImage = imgFile;
    return this;
  }

  set selectedImage (File? imgFile){
    _selectedImage = imgFile;
    notifyListeners();
  }

  void clearImage() {
    _selectedImage = null;
    notifyListeners();
  }

  File? get selectedImage => _selectedImage;

}