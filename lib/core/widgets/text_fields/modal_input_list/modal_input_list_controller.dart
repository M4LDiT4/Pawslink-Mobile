
import 'package:get/get.dart';

class ModalInputListItem {
  final String title;
  final String subtitle;

  ModalInputListItem({
    required this.title,
    required this.subtitle
  });


  String getTitle(){
    return title;
  }

  String getSubTitle(){
    return subtitle;
  }
}

class ModalInputListController extends GetxController {
  final List<ModalInputListItem> valueList = <ModalInputListItem>[].obs;

  @override
  void onInit(){
    super.onInit();
    valueList.add(ModalInputListItem(title: "Title1", subtitle: "Subtitle1"));
    valueList.add(ModalInputListItem(title: "Title2", subtitle: "Subtitle2"));
  }
  List<ModalInputListItem> getValueList(){
    return valueList;
  }
}