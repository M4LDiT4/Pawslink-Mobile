
import 'package:get/get.dart';

class ChipTextinputController extends GetxController {
  final RxSet<String> valueSet = <String>{}.obs;

  void insertValue(String value){
    valueSet.add(value);
  }

  List<String> getValues(){
    return valueSet.toList();
  }
}