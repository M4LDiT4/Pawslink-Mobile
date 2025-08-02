import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/dependency_injection/dependency_injection.dart';
import 'package:mobile_app_template/core/enums/animal_species.dart';
import 'package:mobile_app_template/core/enums/animal_status.dart';
import 'package:mobile_app_template/core/enums/widget_status.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';
import 'package:mobile_app_template/core/widgets/charts/generic_donut_chart.dart';
import 'package:mobile_app_template/data/local_storage/isar/repositories/animal_repository.dart';
import 'package:mobile_app_template/services/api/animal_api.dart';

class GeneralSummaryCardController extends ChangeNotifier {
  WidgetStatus _status = WidgetStatus.idle;
  late AnimalApi _cloudRepo;
  late AnimalRepository _localRepo; 
  int _adoptedCount = 0;
  int _transientCount = 0;
  int _onCampusCount = 0;
  int _rainbowBridgeCount = 0;
  int _ownedCount = 0;
  int _catCount = 0;
  int _dogCount = 0;
  final String _errorMessage = "Failed to query general animal data";

  GeneralSummaryCardController(){
    _initialize();
  }

  void _initialize() {
    _cloudRepo = getIt.get<AnimalApi>();
    _localRepo = getIt.get<AnimalRepository>();
  }
  void _setLoading(){
    if(_status != WidgetStatus.loading){
      _status = WidgetStatus.loading;
      notifyListeners();
    }
  }

  void _unsetLoading(){
    if(_status == WidgetStatus.loading){
      _status = WidgetStatus.idle;
    }
  }

  Future<void> getAdoptedCount() async{
    final adopted = await _localRepo.getAnimalByStatusCoount(AnimalStatus.adopted);
    if(adopted.data != null){
      _adoptedCount = adopted.data!;
    }
  }

  Future<void> getOnCampusCount() async{
    final onCampus = await _localRepo.getAnimalByStatusCoount(AnimalStatus.on_campus);
    if(onCampus.data != null){
      _onCampusCount = onCampus.data!;
    }
  }

  Future<void> getOwnedCount() async{
    final owned = await _localRepo.getAnimalByStatusCoount(AnimalStatus.owned);
    if(owned.data != null){
      _ownedCount = owned.data!;
    }
  }

  Future<void> getTransientCount() async{
    final transient = await _localRepo.getAnimalByStatusCoount(AnimalStatus.transient);
    if(transient.data != null){
      _transientCount = transient.data!;
    }
  }

  Future<void> getRainbowBridgeCount() async{
    final rainbowBridge = await _localRepo.getAnimalByStatusCoount(AnimalStatus.rainbow_bridge);
    if(rainbowBridge.data != null){
      _rainbowBridgeCount = rainbowBridge.data!;
    }
  }

  Future<void> getCatCount() async {
    final catCount = await _localRepo.getAnimalBySpeciesCount(AnimalSpecies.cat);
    if(catCount.data != null){
      _catCount = catCount.data!;
    }
  }

  Future<void> getDogCount() async {
    final dogCount = await _localRepo.getAnimalBySpeciesCount(AnimalSpecies.dog);
    if(dogCount.data != null){
      _dogCount = dogCount.data!;
    }
  }

  Future<void> getGeneralAnimalSummaryData() async {
    try{
      _setLoading();
      await Future.wait([
        getAdoptedCount(),
        getOnCampusCount(),
        getOwnedCount(),
        getTransientCount(),
        getRainbowBridgeCount(),
        getCatCount(),
        getDogCount()
      ]);
      notifyListeners();
      _unsetLoading();

    }catch(err){
      TLogger.error(err.toString());
      _status = WidgetStatus.error;
      notifyListeners();
    }
  }

  int get adoptedCount{
    return _adoptedCount;
  }

  int get onCampusCount{
    return _onCampusCount;
  }

  int get ownedCount{
    return _ownedCount;
  }

  int get transietCount{
    return _transientCount;
  }

  int get rainbowBridgeCount{
    return _rainbowBridgeCount;
  }

  int get catCount{
    return _catCount;
  }
  
  int get dogCount{
    return _dogCount;
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
    return [
      GenericDonutChartParams(
        value: adoptedCount.toDouble(), 
        title: "Adopted", 
        color: AnimalStatus.adopted.color
      ),
      GenericDonutChartParams(
        value: onCampusCount.toDouble(), 
        title: "On Campus", 
        color: AnimalStatus.on_campus.color
      ),
      GenericDonutChartParams(
        value: ownedCount.toDouble(), 
        title: "Owned", 
        color: AnimalStatus.owned.color
      ),
      GenericDonutChartParams(
        value: transietCount.toDouble(), 
        title: "Transient", 
        color: AnimalStatus.adopted.color
      ),
      GenericDonutChartParams(
        value: adoptedCount.toDouble(), 
        title: "Adopted", 
        color: AnimalStatus.transient.color
      ),
      GenericDonutChartParams(
        value: rainbowBridgeCount.toDouble(), 
        title: "Rainbow bridge", 
        color: AnimalStatus.rainbow_bridge.color
      ),
    ];
  }
}