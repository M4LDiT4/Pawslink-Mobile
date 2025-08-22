import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app_template/core/constants/image_strings.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/enums/animal_sex.dart';
import 'package:mobile_app_template/core/navigation/routes/app_routes.dart';
import 'package:mobile_app_template/core/utils/colors/color_utils.dart';
import 'package:mobile_app_template/data/model/animal_profile_item.dart';
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

  void _gotoDetails () {
    TNavigationService.toNamed(TAppRoutes.viewAnimalDetails);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: _gotoDetails,
      leading: Image.asset(TImages.catIcon),
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