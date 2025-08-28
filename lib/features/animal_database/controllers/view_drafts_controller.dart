
import 'package:get/get.dart';

class ViewDraftsController extends GetxController {
  final multiSelect = RxBool(false);
  final selectedIdList = <String>[].obs;

  void addSelected(String id){
    selectedIdList.add(id);
  }

  List<String> get selectedItems{
    return List.unmodifiable(selectedIdList);
  }
}