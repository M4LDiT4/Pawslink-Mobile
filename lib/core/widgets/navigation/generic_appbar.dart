import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/constants/image_strings.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/utils/device/device_utility.dart';

class GenericAppbar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final PreferredSizeWidget? bottom;
  final bool showLeading;
  final List<Widget>? actions; // <-- NEW

  const GenericAppbar({
    super.key,
    this.height = kToolbarHeight,
    this.bottom,
    this.showLeading = true,
    this.actions, // <-- NEW
  });

  @override
  Widget build(BuildContext context) {
    final bool canPop = Get.previousRoute.isNotEmpty && showLeading;
    final isDarkMode = TDeviceUtils.isDarkMode();

    return AppBar(
      leading: canPop
          ? IconButton(
              onPressed: Get.back,
              icon: Icon(
                size: TSizes.iconxl,
                color: isDarkMode ? TColors.primaryDark : TColors.primary,
                Iconsax.arrow_circle_left,
              ),
            )
          : null,
      title: Image.asset(
        width: 130,
        TImages.logoPawslinkColored,
      ),
      centerTitle: true,
      automaticallyImplyLeading: true,
      elevation: 0,
      bottom: bottom,
      actions: actions, // <-- Attach actions here
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(height + (bottom?.preferredSize.height ?? 0));
}
