import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/utils/device/device_utility.dart';

class KeyboardSafeScrollView extends StatelessWidget {
  final Widget child;
  final bool useBottomNavBarPadding;


  const KeyboardSafeScrollView({
    super.key,
    required this.child,
    this.useBottomNavBarPadding = false
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = TDeviceUtils.getScreenHeight();
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: useBottomNavBarPadding ? TDeviceUtils.getBottomNavigationBarHeight() : 0,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: screenHeight),
            child: IntrinsicHeight(
              child: child,
            ),
          ),
        );
      },
    );
  }
}
