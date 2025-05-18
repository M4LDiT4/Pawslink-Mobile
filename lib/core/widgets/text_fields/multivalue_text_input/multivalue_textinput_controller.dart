
import 'package:flutter/widgets.dart';
import 'package:mobile_app_template/core/widgets/text_fields/multivalue_text_input/multivalue_textfield.dart';

class MultiValueTextfieldController extends ChangeNotifier {

  final List<TextEditingController> valueList = <TextEditingController>[];

  int getvalueListCount(){
    return valueList.length;
  }

  void handleButtonPress(int index, ActionButtonMode mode){
    if(mode == ActionButtonMode.add){
      valueList.add(TextEditingController());
    }else{
      valueList.removeAt(index);
    }
    notifyListeners();
  }
  List<TextEditingController> getValues(){
    return valueList;
  }

  List<String> getStringValues (){
    final stringList = <String>[];
    for(var controller in valueList){
      if(controller.text.isNotEmpty){
        stringList.add(controller.text);
      }
    }
    return stringList;

  }
}