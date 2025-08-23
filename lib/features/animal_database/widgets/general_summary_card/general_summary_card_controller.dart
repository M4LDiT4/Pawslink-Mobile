import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/dependency_injection/dependency_injection.dart';
import 'package:mobile_app_template/core/enums/animal_species.dart';
import 'package:mobile_app_template/core/enums/animal_status.dart';
import 'package:mobile_app_template/core/enums/widget_status.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';
import 'package:mobile_app_template/core/widgets/charts/generic_donut_chart.dart';
import 'package:mobile_app_template/domain/services/animal%20database/animal_database_service.dart';
import 'package:mobile_app_template/features/animal_database/widgets/general_summary_card/general_animal_summary.dart';

class GeneralSummaryCardController extends ChangeNotifier {
  GeneralAnimalSummary _animalSummary = GeneralAnimalSummary();
  final String _errorMessage = "Failed to query general animal data";

  // repositories
  late AnimalDatabaseService _localRepo; 

  //controller states
  WidgetStatus _status = WidgetStatus.idle;
  bool _hasLoaded = false;

  GeneralSummaryCardController(){
    _localRepo = getIt.get<AnimalDatabaseService>();
    _setLoading();
  }


  void loadInitialData() async {
    _hasLoaded = true;
    await getGeneralAnimalSummaryData();
  }
  void _setLoading(){
    if(_status != WidgetStatus.loading){
      _status = WidgetStatus.loading;
      notifyListeners();
    }
  }

  Future<void> getGeneralAnimalSummaryData() async {
    try{
      _setLoading();
      final statusSummary = await _localRepo.getAnimalStatusSummaryData();
      final catCount = await _localRepo.getSpeciesCount(AnimalSpecies.cat);
      final dogCount = await _localRepo.getSpeciesCount(AnimalSpecies.dog);
      final unknownCount = await _localRepo.getSpeciesCount(AnimalSpecies.unknown);
      if(statusSummary.isSuccessful
        && catCount.isSuccessful
        && dogCount.isSuccessful
        && unknownCount.isSuccessful
      ){
        final statusData = statusSummary.data ?? {};

        final genData = GeneralAnimalSummary(
          adopted: statusData[AnimalStatus.adopted.name] ?? 0,
          onCampus: statusData[AnimalStatus.onCampus.name] ?? 0,
          owned: statusData[AnimalStatus.owned.name] ?? 0,
          transient: statusData[AnimalStatus.transient.name] ?? 0,
          rainbowBridge: statusData[AnimalStatus.rainbowBridge.name] ?? 0,
          unknown: statusData[AnimalStatus.unknown.name] ?? 0,
          cat: catCount.data ?? 0,
          dog: dogCount.data ?? 0,
        );

        _animalSummary = genData;
        _status = WidgetStatus.idle;
      }else{
        //keep the current summary data
        _status = WidgetStatus.error;
      }
      notifyListeners();

    }catch(err){
      TLogger.error(err.toString());
      _status = WidgetStatus.error;
      notifyListeners();
    }
  }

  int get adoptedCount{
    return _animalSummary.adopted;
  }

  int get onCampusCount{
    return _animalSummary.onCampus;
  }

  int get ownedCount{
    return _animalSummary.owned;
  }

  int get transientCount{
    return _animalSummary.transient;
  }

  int get rainbowBridgeCount{
    return _animalSummary.rainbowBridge;
  }

  int get catCount{
    return _animalSummary.cat;
  }
  
  int get dogCount{
    return _animalSummary.dog;
  }

  String get errorMessage{
    return _errorMessage;
  }

  WidgetStatus get status {
    return _status;
  }

  List<GenericDonutChartParams> getDonutValues(){
    if(_status == WidgetStatus.loading || _status == WidgetStatus.error){
      return [];
    }
    return _animalSummary.toDonutChartParams();
  }

  bool get hasDataToDisplay {
    return _animalSummary.hasData();
  }

  bool get hasLoaded => _hasLoaded;
}

