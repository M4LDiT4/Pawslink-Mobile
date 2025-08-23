import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:mobile_app_template/core/dependency_injection/dependency_injection.dart';
import 'package:mobile_app_template/core/enums/animal_sex.dart';
import 'package:mobile_app_template/core/enums/animal_species.dart';
import 'package:mobile_app_template/core/enums/animal_status.dart';
import 'package:mobile_app_template/core/enums/widget_status.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';
import 'package:mobile_app_template/data/model/animal_profile_item.dart';
import 'package:mobile_app_template/domain/services/animal%20database/animal_database_service.dart';
import 'package:mobile_app_template/domain/services/local/animal_repository.dart';

class ViewAnimalListController extends GetxController {
  final AnimalDatabaseService _service = getIt.get<AnimalDatabaseService>();

  final animals = <AnimalProfile>[].obs;
  final status = WidgetStatus.idle.obs;
  final canLoadMore = true.obs;
  final pageNumber = 1.obs;
  final int itemsPerPage = 10;

  AnimalSex? _sexFilter;
  AnimalSpecies? _speciesFilter;
  AnimalStatus? _animalStatusFilter;

  AnimalSortBy? _sortBy;
  Sort _sortOrder = Sort.asc;

  @override
  void onInit() {
    super.onInit();
    loadAnimals();
  }

  Future<void> loadAnimals() async {
    if (!canLoadMore.value) return;
    if (status.value == WidgetStatus.loading) return;

    status.value = WidgetStatus.loading;

    try {
      final response = await _service.getLocalAnimals(
        page: pageNumber.value,
        sex: _sexFilter,
        status: _animalStatusFilter,
        species: _speciesFilter,
        sortBy: _sortBy,
        sortOrder: _sortOrder,
      );

      final fetched = response.data ?? [];

      if (fetched.isEmpty || fetched.length < itemsPerPage) {
        canLoadMore.value = false;
      }

      final newAnimals = fetched
          .where((animal) => animal.remoteId != null)
          .map((animal) => AnimalProfile(
                name: animal.name,
                location: animal.location,
                sex: animal.sex,
                id: animal.remoteId!,
                status: animal.status,
                species: animal.species,
                animalProfileLink: animal.profileImagePath,
              ))
          .toList();

      if (pageNumber.value == 1) {
        animals.value = newAnimals; // replace for first page
      } else {
        animals.addAll(newAnimals);
      }

      if (newAnimals.isNotEmpty) pageNumber.value++;

      status.value = WidgetStatus.idle;
    } catch (err) {
      TLogger.error('Failed to get paginated data: $err');
      status.value = WidgetStatus.error;
    }
  }

  void setSortConfig({AnimalSortBy? sortBy, Sort? sortOrder}) {
    _sortBy = sortBy;
    if (sortOrder != null) _sortOrder = sortOrder;

    // Reset pagination
    pageNumber.value = 1;
    canLoadMore.value = true;
    animals.clear();

    loadAnimals();
  }

  void setFilterConfig({
    AnimalSex? sex,
    AnimalSpecies? species,
    AnimalStatus? status,
  }) {
    _sexFilter = sex;
    _speciesFilter = species;
    _animalStatusFilter = status;

    // Reset pagination
    pageNumber.value = 1;
    canLoadMore.value = true;
    animals.clear();

    loadAnimals();
  }

  AnimalSortBy? get sortBy => _sortBy;
  Sort get sortOrder => _sortOrder;
  AnimalSex? get sex => _sexFilter;
  AnimalSpecies? get species => _speciesFilter;
  AnimalStatus? get animalStatus => _animalStatusFilter;
}

