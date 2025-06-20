import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/constants/text_strings.dart';
import 'package:mobile_app_template/core/navigation/route_params/add_animal_summary.dart';
import 'package:mobile_app_template/core/navigation/routes/app_routes.dart';
import 'package:mobile_app_template/core/utils/colors/color_utils.dart';
import 'package:mobile_app_template/core/utils/http/response.dart';
import 'package:mobile_app_template/core/widgets/buttons/form_button/form_button.dart';
import 'package:mobile_app_template/core/widgets/dialogs/animated_dialog.dart';
import 'package:mobile_app_template/core/widgets/dialogs/loading_dialog/loading_dialog.dart';
import 'package:mobile_app_template/core/widgets/navigation/generic_appbar.dart';
import 'package:mobile_app_template/data/model/modal_input_list_item.dart';
import 'package:mobile_app_template/services/api/animal_api.dart';
import 'package:mobile_app_template/services/navigation_service.dart';

class AddAnimalSummary extends StatelessWidget {
  final AddAnimalSummaryParams params = Get.arguments as AddAnimalSummaryParams;

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

  Future<TResponse> _saveAnimal() async {
    //please invoke AnimalApi().init()
    //before using the api 
    return  AnimalApi().addAnimal(params);
  }

  //pops the getx navigation stack until the name route home is found
  void _popUntilHome() {
    TNavigationService.offAllNamed(TAppRoutes.home);
  }

  void _showAnimatedDialog(BuildContext context){
    AnimalApi().init();
    AnimatedDialog.show(
      context, 
      child: LoadingDialog(
        asyncFunction: _saveAnimal,
        successMessage: "Animal added successfully!",
        errorMessage: "Failed to add animal!",
        loadingMessage: "Saving animal info...",
        successFuction: _popUntilHome,
      )
    );
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
                onPressed: (){_showAnimatedDialog(context);}, 
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
