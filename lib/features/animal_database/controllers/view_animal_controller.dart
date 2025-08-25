import 'package:get/get.dart';
import 'package:mobile_app_template/core/constants/lottie_strings.dart';
import 'package:mobile_app_template/core/utils/helpers/ui_helpers.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';
import 'package:mobile_app_template/core/widgets/dialogs/async_generic_loader/async_generic_loader.dart';
import 'package:mobile_app_template/domain/services/animal%20database/animal_database_service.dart';
import 'package:mobile_app_template/features/animal_database/widgets/update_confirmation_dialog.dart';
import 'package:mobile_app_template/navigation/navigation_service.dart';
import 'package:mobile_app_template/network/operation_response.dart';

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
        const UpdateConfirmationDialog(),
        title: "Update Local Animal Data?"
      );

      if(response){
        final updateResponse = await TUIHelpers.showResponsiveModal<OperationResponse>(
          child: AsyncGenericLoader(
            title: "Updating Local Animal Database",
            asyncFunction: _service.syncAnimals,
            lottieString: TLottie.update,
          )
        );
        if(updateResponse != null && updateResponse.isSuccessful){
          TUIHelpers.showStateSnackBar(
            "Update successful",
            state: SnackBarState.success
          );
        }else{
          TUIHelpers.showStateSnackBar(
            "Update Failed",
            state: SnackBarState.error
          );
        }
      } 
      TNavigationService.back();
    }catch(err){
      TLogger.error("Problem updating data ${err.toString()}");
    }
  }
}
