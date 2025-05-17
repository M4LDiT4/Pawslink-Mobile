
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/utils/device/device_utility.dart';
import 'package:mobile_app_template/core/widgets/text_fields/modal_input_list/modal_input_list_controller.dart';

class ModalInputListItemCard extends StatelessWidget {
  final ModalInputListItem item;
  const ModalInputListItemCard({
    super.key,
    required this.item
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = TDeviceUtils.isDarkMode();
    return Card(
      color: isDarkMode? TColors.backgroundDark : TColors.backgroundLight,
      child: ListTile(
        leading:const Icon(Icons.vaccines),
        title: Text(item.getTitle()),
        subtitle: Text(item.getSubTitle()),
        trailing: IconButton(onPressed: (){}, icon:const Icon(Iconsax.close_square)),
      ),
    );
  }
}