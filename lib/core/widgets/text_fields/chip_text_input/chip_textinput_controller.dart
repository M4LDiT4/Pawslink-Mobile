
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobile_app_template/core/widgets/text_fields/chip_text_input/chip_textfield.dart';

class ChipTextinputController extends GetxController {

  final RxList<TextEditingController> valueList = <TextEditingController>[].obs;

  @override
  void onInit(){
    super.onInit();
    if(valueList.isEmpty){
      valueList.add(TextEditingController()); //
    }
  }

  int getvalueListCount(){
    return valueList.length;
  }

  void handleButtonPress(int index, ActionButtonMode mode){
    if(mode == ActionButtonMode.add){
      valueList.add(TextEditingController());
    }else{
      valueList.removeAt(index);
    }
  }
  List<TextEditingController> getValues(){
    return valueList;
  }
}