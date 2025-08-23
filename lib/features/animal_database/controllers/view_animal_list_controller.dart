import 'package:get/get.dart';
import 'package:mobile_app_template/core/dependency_injection/dependency_injection.dart';
import 'package:mobile_app_template/core/enums/widget_status.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';
import 'package:mobile_app_template/data/model/animal_profile_item.dart';
import 'package:mobile_app_template/domain/services/animal%20database/animal_database_service.dart';

class ViewAnimalListController extends GetxController {
  final AnimalDatabaseService _service = getIt.get<AnimalDatabaseService>();

  final animals = <AnimalProfile>[].obs;
  final status = WidgetStatus.idle.obs;
  final canLoadMore = true.obs;
  final pageNumber = 1.obs;
  final int itemsPerPage = 10;

  @override
  void onInit() {
    super.onInit();
    loadAnimals(); // Fetch initial data when controller is created
  }

  Future<void> loadAnimals() async {
    if (!canLoadMore.value) return;

    status.value = WidgetStatus.loading;

    try {
      final response = await _service.getLocalAnimals(page: pageNumber.value);

      if (response.data != null) {
        final fetched = response.data!;

        // Stop loading more if no items returned or fewer than expected per page
        if (fetched.isEmpty || fetched.length < itemsPerPage) {
          canLoadMore.value = false;
        }

        // Add valid animals to the list
        final newAnimals = fetched
            .where((animal) => animal.remoteId != null)
            .map(
              (animal) => AnimalProfile(
                name: animal.name,
                location: animal.location,
                sex: animal.sex,
                id: animal.remoteId!,
                status: animal.status,
                species: animal.species,
              ),
            )
            .toList();

        animals.addAll(newAnimals);

        // Increment page only if we got some data
        if (newAnimals.isNotEmpty) pageNumber.value++;
      }

      status.value = WidgetStatus.idle;
    } catch (err) {
      TLogger.error('Failed to get paginated data from database ${err.toString()}');
      status.value = WidgetStatus.error;
    }
  }
}

