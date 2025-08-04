import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/constants/text_strings.dart';
import 'package:mobile_app_template/core/dependency_injection/dependency_injection.dart';
import 'package:mobile_app_template/core/navigation/route_params/add_animal_summary.dart';
import 'package:mobile_app_template/core/navigation/routes/app_routes.dart';
import 'package:mobile_app_template/core/utils/colors/color_utils.dart';
import 'package:mobile_app_template/core/utils/formatters/formatter.dart';
import 'package:mobile_app_template/core/utils/helpers/ui_helpers.dart';
import 'package:mobile_app_template/core/utils/http/response.dart';
import 'package:mobile_app_template/core/utils/internet_connection/connection_controller.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';
import 'package:mobile_app_template/core/widgets/buttons/form_button/form_button.dart';
import 'package:mobile_app_template/core/widgets/dialogs/animated_dialog.dart';
import 'package:mobile_app_template/core/widgets/dialogs/loading_dialog/loading_dialog.dart';
import 'package:mobile_app_template/core/widgets/dialogs/save_to_drafts/save_to_drafts_dialog.dart';
import 'package:mobile_app_template/core/widgets/navigation/generic_appbar.dart';
import 'package:mobile_app_template/data/local_storage/isar/repositories/animal_repository.dart';
import 'package:mobile_app_template/data/model/modal_input_list_item.dart';
import 'package:mobile_app_template/services/api/animal_api.dart';
import 'package:mobile_app_template/services/navigation/navigation_service.dart';

class AddAnimalSummary extends StatelessWidget {
  final AddAnimalSummaryParams params = Get.arguments as AddAnimalSummaryParams;
  final AnimalApi _animalApi = getIt.get<AnimalApi>();
  final AnimalRepository _animalRepository = getIt.get<AnimalRepository>();
  final ConnectionController _connectionController = Get.find<ConnectionController>();

  AddAnimalSummary({super.key});

  Widget _buildInfoTile(String? label, String value, IconData icon, {String? suffix}) {
    return ListTile(
      leading: Icon(icon, color: TColorUtils.tertiary()),
      title: Text(
        "$value ${suffix ?? ""}",
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: label != null ? Text(label) : null,
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(Get.context!).colorScheme.primary,
              ),
        ),
        const SizedBox(height: 12),
        ...children,
        const Divider(height: 32),
      ],
    );
  }

  Widget _buildFixedSection(String title, List<Widget> children) {
    return _buildSection(title, children);
  }

  Widget _buildSectionWithList(String title, List<String> stringlist, IconData leadingIcon) {
    final children = <Widget>[];
    if (stringlist.isEmpty) {
      children.add(
        ListTile(
          title: Text(
            TText.noRecord,
            style: TextStyle(color: Theme.of(Get.context!).hintColor),
          ),
        ),
      );
    } else {
      for (var item in stringlist) {
        children.add(_buildInfoTile(null, item, leadingIcon));
      }
    }
    return _buildSection(title, children);
  }

  Widget _buildSectionWithModalInputListItem(String title, List<ModalInputListItem> stringlist, IconData leadingIcon) {
    final children = <Widget>[];
    if (stringlist.isEmpty) {
      children.add(
        ListTile(
          title: Text(
            TText.noRecord,
            style: TextStyle(color: Theme.of(Get.context!).hintColor),
          ),
        ),
      );
    } else {
      for (var item in stringlist) {
        children.add(_buildInfoTile(null, item.getValueInString(), leadingIcon));
      }
    }
    return _buildSection(title, children);
  }

  //pops the getx navigation stack until the name route home is found
  void _popUntilHome() {
    TNavigationService.until(TAppRoutes.home);
  }

  void _saveAnimalOnCloud(BuildContext context) async {
    try{
      final result = await AnimatedDialog.show(
        context, 
        child: _buildDialog(() => _animalApi.addAnimal(params))
      );

      if(result.isSuccessful){
        _popUntilHome();
      }
    }catch(e){
      TLogger.error(e.toString());
    }
  }

  LoadingDialog _buildDialog(Future<TResponse<dynamic>>  Function() asyncFunction){
    return LoadingDialog(
      asyncFunction: asyncFunction,
      successMessage: "Animal added successfully!",
      errorMessage: "Failed to add animal!",
      loadingMessage: "Saving animal info...",
    );
  }

  void _saveAnimalLocally(BuildContext context) async{
    try{
      final result = await AnimatedDialog.show(
        context, 
        child: _buildDialog(()=>_animalRepository.addAnimal(params))
      );
      if(result.isSuccessful){
        _popUntilHome();
      }else{
        TUIHelpers.showStateSnackBar("Failed to save ${params.name}", state: SnackBarState.error);
        TNavigationService.back();
      }

    }catch(err){
      TLogger.error(err.toString());
    }
  }
  void _handleSave(BuildContext context) async{
    if(_connectionController.isConnected){
      _saveAnimalOnCloud(context);
    }else{
      final response = await AnimatedDialog.show(
        context, 
        child:const SaveToDraftsDialog()
      );
      final saveToDrafts = response.isSuccessful;

      if(!context.mounted) return;

      if(saveToDrafts){
        _saveAnimalLocally(context);
      }else{
        TUIHelpers.showStateSnackBar("No internet connection. Try Again later");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const GenericAppbar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultScreenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Summary", style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 24),

            _buildFixedSection(
              TText.basicInformation,[
              _buildInfoTile(TText.name, params.name, Iconsax.pet),
              _buildInfoTile(TText.age, params.age, Iconsax.cake, suffix: "months"),
              _buildInfoTile(TText.location, params.location, Iconsax.location),
              _buildInfoTile(TText.sex, params.sex, Iconsax.user),
              _buildInfoTile(TText.species, params.species, Iconsax.category),
              _buildInfoTile(TText.status, params.status, Iconsax.status),
              _buildInfoTile(
                params.sex.toLowerCase() == "male"? "Neutered" : "Spayed", 
                params.sterilizationDate == null? "No"
                  : "Yes (${TFormatter.formatDate(params.sterilizationDate!)})", 
                Iconsax.scissor
              )
            ]),
            _buildSectionWithList(TText.coatColor, params.coatColor, Icons.color_lens),
            _buildSectionWithList(TText.traitsAndPersonality, params.traits, Icons.tag),
            _buildSectionWithList(TText.notes, params.notes, Iconsax.note),
            _buildSectionWithModalInputListItem(TText.vaxHistory, params.vaccinations, Icons.vaccines),
            _buildSectionWithModalInputListItem(TText.medHistory, params.medications, Icons.medical_information),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: FormButton(
                onPressed: (){_handleSave(context);}, 
                type: FormButtonType.confirm,
                child: const Text(TText.confirm),
              )
            )
          ],
        ),
      ),
    );
  }
}
