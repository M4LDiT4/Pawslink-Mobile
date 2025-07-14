import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/utils/device/device_utility.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = TDeviceUtils.isDarkMode();
    return  Text(
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
        color: isDarkMode? TColors.primaryDark : TColors.primary
      ),
      title
    );
  }
}