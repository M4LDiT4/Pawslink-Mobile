
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_app_template/core/constants/lottie_strings.dart';
import 'package:mobile_app_template/core/utils/helpers/ui_helpers.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';
import 'package:mobile_app_template/domain/services/animal%20database/animal_database_service.dart';

class ViewAnimalController extends GetxController {
  final AnimalDatabaseService _service;

  ViewAnimalController(AnimalDatabaseService service): _service = service;

  final updatesAvailable = RxnInt(null);
  bool isLoading = false;


  Future<void> checkIfUpdatesAvailable()async{
    if(isLoading){
      return;
    }
    isLoading = true;
    final response = await _service.checkIfUpdatesAvailable();
    if(response.isSuccessful){
      updatesAvailable.value = response.data ?? 0;
    }
    isLoading = false;
  }

  Future<void> updateAnimals()async{
    try{
      final response = await TUIHelpers.showDefaultDialog(
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRect(
              child: Align(
                alignment: Alignment.center,
                heightFactor: 0.6, // crop vertically
                child: Lottie.asset(TLottie.dogWaiting),
              ),
            ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Updating ensures you have the most recent information."
            ),
          ),
        ],),
        title: "Update Local Animal Data?"
      );
      // await _service.syncAnimals();
    }catch(err){
      TLogger.error("Problem updating data ${err.toString()}");
    }
  }
}