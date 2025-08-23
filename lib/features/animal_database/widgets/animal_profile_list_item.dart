import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_app_template/core/constants/lottie_strings.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/dependency_injection/dependency_injection.dart';
import 'package:mobile_app_template/core/enums/animal_sex.dart';
import 'package:mobile_app_template/core/navigation/routes/app_routes.dart';
import 'package:mobile_app_template/core/utils/colors/color_utils.dart';
import 'package:mobile_app_template/core/utils/helpers/ui_helpers.dart';
import 'package:mobile_app_template/core/widgets/image/smart_image.dart';
import 'package:mobile_app_template/data/model/animal_profile_item.dart';
import 'package:mobile_app_template/domain/services/animal%20database/animal_database_service.dart';
import 'package:mobile_app_template/navigation/navigation_service.dart';

class AnimalProfileListItem extends StatelessWidget {
  final AnimalProfile profile;
  const AnimalProfileListItem({
    super.key,
    required this.profile
  });

  Widget _generateSexIcon(){
    return Icon(
      profile.sex.icon,
      color: profile.sex.color,
    );
  }

  void _gotoDetails (BuildContext context) async{
     showDialog(
      context: context,
      builder: (_) => const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );
    final service = getIt<AnimalDatabaseService>();
    final response = await service.getAnimalByBSONId(profile.id);
    TNavigationService.back();
    if(response.data != null){
      TNavigationService.toNamed(TAppRoutes.viewAnimalDetails, arguments: response.data);
    }else{
      TUIHelpers.showStateSnackBar("Something went wrong, cannot go to animal details");
    }
  }
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => _gotoDetails(context),
      leading: SizedBox(
        width: 48,
        height: 48,
        child: SmartImage(
          path: profile.animalProfileLink, 
          fallbackAsset: profile.getFallBackImage()
        ),
      ),
      title: Row(
        children: [
          _generateSexIcon(),
          Text(profile.name)
        ],
      ),
      subtitle: Text(profile.status.name),
      trailing: IconButton(
        onPressed: (){}, 
        icon: Icon(
          size: TSizes.iconmd,
          color: TColorUtils.primary(),
          Iconsax.edit
        )
      ),
    );
  }
}