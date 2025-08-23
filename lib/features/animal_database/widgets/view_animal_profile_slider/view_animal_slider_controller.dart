
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:mobile_app_template/core/dependency_injection/dependency_injection.dart';
import 'package:mobile_app_template/core/enums/widget_status.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';
import 'package:mobile_app_template/data/model/animal_profile_item.dart';
import 'package:mobile_app_template/domain/services/animal%20database/animal_database_service.dart';
import 'package:mobile_app_template/domain/services/local/animal_repository.dart';

class ViewAnimalSliderController extends ChangeNotifier {
  List<AnimalProfile> _animals = [];
  WidgetStatus _status = WidgetStatus.idle;
  late AnimalDatabaseService _localRepo;
  bool _hasLoaded = false;


  ViewAnimalSliderController(){
    _localRepo = getIt<AnimalDatabaseService>();
    _setLoading();
  }

  void loadInitialData() async{
    _hasLoaded = true;
    await getLatestModifiedAnimal();
  }

  void _setLoading(){
    if(_status != WidgetStatus.loading){
      _status = WidgetStatus.loading;
      notifyListeners();
    }
  }

  Future<void> getLatestModifiedAnimal() async{
    try{
      _setLoading();
      final response = await _localRepo.getLocalAnimals(
        sortBy: AnimalSortBy.updatedAt,
        sortOrder: Sort.desc,
        itemsPerPage: 10
      );
      if(response.isSuccessful && response.data != null){
        final data = response.data!;
        for(int i = 0; i < data.length ; i++){
          final animal = data[i];
          if(animal.remoteId != null){
            _animals.add(
              AnimalProfile(
                name: animal.name, 
                location: animal.location, 
                sex: animal.sex, 
                id: animal.remoteId!, 
                status: animal.status, 
                species: animal.species,
                animalProfileLink: animal.profileImagePath
              )
            );
          }
        }
      }else if(response.data == null){
        //get the cache if ever
        _animals = [];
      }else{
        throw Exception('Operation failed: ${response.message.toString()}');
      }
      _status = WidgetStatus.idle;
    }catch(err){
      TLogger.error('Failed to get latest modified animals: ${err.toString()}');
      _status = WidgetStatus.error;
    }finally{
      notifyListeners();
    }
  }
  WidgetStatus get status => _status;
  List<AnimalProfile> get animals => List.unmodifiable(_animals);
  bool get hasLoaded => _hasLoaded;
}