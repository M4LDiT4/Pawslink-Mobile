
import 'package:get/get.dart';
import 'package:mobile_app_template/core/dependency_injection/dependency_injection.dart';
import 'package:mobile_app_template/core/enums/widget_status.dart';
import 'package:mobile_app_template/domain/entities/animal_dto.dart';
import 'package:mobile_app_template/domain/services/animal%20database/animal_database_service.dart';

class ViewDraftsController extends GetxController {
  late final AnimalDatabaseService _service;
  final multiSelect = false.obs;
  final selectedIdList = <String>[].obs;
  final animalDrafts = <AnimalDTO>[].obs;
  final status = WidgetStatus.idle.obs;
  String errMessage = '';

  @override
  void onInit() {
    super.onInit();
    _service = getIt<AnimalDatabaseService>();
    getAnimalDrafts();
  }

  void addSelected(String id) {
    if (!selectedIdList.contains(id)) {
      selectedIdList.add(id);
    }
  }

  void removeSelected(String id) {
    selectedIdList.remove(id);
  }

  Future<void> getAnimalDrafts() async {
    status.value = WidgetStatus.loading;
    final response = await _service.getAnimalDrafts();
    if (response.isSuccessful && response.data != null) {
      animalDrafts.assignAll(response.data!);
      status.value = WidgetStatus.idle;
    } else {
      status.value = WidgetStatus.error;
      errMessage = response.message ?? "Failed to get drafts";
    }
  }

  List<String> get selectedItems => List.unmodifiable(selectedIdList);
}

