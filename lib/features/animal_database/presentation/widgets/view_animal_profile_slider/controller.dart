
import 'package:flutter/material.dart';

class ViewAnimalSliderController extends ChangeNotifier {
  bool _isLoading = true;

// just returns _isLoading
  set isLoading(bool value) => _isLoading = value;  // just sets _isLoading
}