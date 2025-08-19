
import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/dependency_injection/dependency_injection.dart';
import 'package:mobile_app_template/core/enums/animal_species.dart';
import 'package:mobile_app_template/core/enums/widget_status.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';
import 'package:mobile_app_template/core/widgets/charts/generic_donut_chart.dart';
import 'package:mobile_app_template/domain/services/local/animal_repository.dart';
import 'package:mobile_app_template/features/animal_database/widgets/animal_summary_card/animal_species_summary.dart';
import 'package:mobile_app_template/services/api/animal_api.dart';

class AnimalSpeciesSummaryCardController extends ChangeNotifier {
  WidgetStatus _status = WidgetStatus.idle;
  late String _errorMessage;
  late AnimalSpecies _species;

  //repositories
  late AnimalRepository _localRepo;
  late AnimalApi _cloudRepo;

  //controller states
  bool _hasLoaded = false;

  AnimalSpeciesSummary _summary = AnimalSpeciesSummary();

  AnimalSpeciesSummaryCardController({
    required AnimalSpecies species,
  }) {
    _species = species;
    _errorMessage = "Failed to query ${species.name} animal data";
    _cloudRepo = getIt.get<AnimalApi>();
    _localRepo = getIt.get<AnimalRepository>();
    _setLoading();
  }

  void _setLoading(){
    if(_status != WidgetStatus.loading){
      _status = WidgetStatus.loading;
      notifyListeners();
    }
  }

  void loadInitialData() async {
    // set the has loaded flag to true
    // helps in preventing loading side effects
    _hasLoaded = true;
    await getAnimalSpeciesSummaryData();
  }

  Future<void> getAnimalSpeciesSummaryData() async {
    try{
      _setLoading();
      final summaryData = await _localRepo.getAnimalSpeciesSummaryData(_species);
      if(summaryData.success){
        _summary = summaryData.data!;
        _status = WidgetStatus.idle;
      }else {
        _status = WidgetStatus.error;
      }
      notifyListeners();
    }catch(err){
      TLogger.error(err.toString());
      _status = WidgetStatus.error;
      notifyListeners();
    }
  }

  WidgetStatus get status => _status;

  String get errorMessage => _errorMessage;

  int get femaleCount => _summary.femaleCount;
  
  int get maleCount => _summary.maleCount;

  int get spayedCount => _summary.spayedCount;

  int get neuteredCount => _summary.neuteredCount;

  List<GenericDonutChartParams> getDonutValues() {
    return _summary.toDonutChartParams();
  }

  bool get hasDataToDisplay => _summary.hasData;

  bool get hasLoaded => _hasLoaded;
}