
import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/enums/animal_species.dart';
import 'package:mobile_app_template/core/enums/widget_status.dart';
import 'package:mobile_app_template/features/animal_database/widgets/animal_summary_card/animal_species_summary.dart';

class AnimalSummaryCardController extends ChangeNotifier {
  WidgetStatus _status = WidgetStatus.idle;
  late String _errorMessage;
  late AnimalSpecies _species;

  AnimalSpeciesSummary _summary = AnimalSpeciesSummary();

  AnimalSummaryCardController({
    required AnimalSpecies species,
  }) {
    _species = species;
    _errorMessage = "Failed to query ${species.name} animal data";
    _initialize();
  }

  void _setLoading(){
    if(_status != WidgetStatus.loading){
      _status = WidgetStatus.loading;
      notifyListeners();
    }
  }

  void _initialize() async {
    _setLoading();
    
  }

  WidgetStatus get status => _status;

  String get errorMessage => _errorMessage;

  int get femaleCount => _summary.femaleCount;
  
  int get maleCount => _summary.maleCount;

  int get spayedCount => _summary.spayedCount;

  int get neuteredCount => _summary.neuteredCount;
}