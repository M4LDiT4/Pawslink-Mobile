import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/utils/device/device_utility.dart';
import 'package:mobile_app_template/core/widgets/text_fields/modal_input_list/modal_input_list_controller.dart';

class ModalInputListItemCard extends StatefulWidget {
  final ModalInputListItem item;
  final VoidCallback onPressed;
  final IconData? icon;

  const ModalInputListItemCard({
    super.key,
    required this.item,
    required this.onPressed,
    this.icon,
  });

  @override
  State<ModalInputListItemCard> createState() => _ModalInputListItemCardState();
}

class _ModalInputListItemCardState extends State<ModalInputListItemCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scaleAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  void _handleRemove() async {
    // Play reverse animation, then call the external onPressed
    await _controller.reverse();
    widget.onPressed();
  }

  Widget? _generateIcon(){
    if(widget.icon == null){
      return null;
    }
    return Icon(widget.icon);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = TDeviceUtils.isDarkMode();

    return ScaleTransition(
      scale: _scaleAnimation,
      child: Card(
        color: isDarkMode ? TColors.backgroundDark : TColors.backgroundLight,
        child: ListTile(
          leading: _generateIcon(),
          title: Text(widget.item.getTitle()),
          subtitle: Text(widget.item.getSubTitle()),
          trailing: IconButton(
            onPressed: _handleRemove,
            icon: const Icon(
              color: TColors.warning,
              Iconsax.close_square
            ),
          ),
        ),
      ),
    );
  }
}
