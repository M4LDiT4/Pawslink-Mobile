import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app_template/core/constants/image_strings.dart';

class GenericAppbar extends StatelessWidget implements PreferredSizeWidget {

  final double height;

  const GenericAppbar({
    super.key,
    this.height = kToolbarHeight,
  });

  @override
  Widget build(BuildContext context) {
    final bool canPop = Get.previousRoute.isNotEmpty;
    return AppBar(
      leading: canPop? IconButton(
        onPressed: Get.back, 
        icon: const Icon(Iconsax.arrow_circle_left)
      ) : null,
      title: Center(
        child: Image.asset(
          width: 130,
          TImages.logoPawslinkColored
        ),
      ),
      centerTitle: true,
      automaticallyImplyLeading: true,
      elevation: 0,
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(height);
}