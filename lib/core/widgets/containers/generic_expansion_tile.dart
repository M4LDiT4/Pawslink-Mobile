
import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_app_template/core/utils/device/device_utility.dart';

class GenericExpansionTile extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const GenericExpansionTile({
    super.key,
    required this.children,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = TDeviceUtils.isDarkMode();
      return Card(
        child: Padding(
        padding: const EdgeInsets.all(TSizes.paddingmd),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child:ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: isDarkMode? TColors.primaryDark : TColors.primary,
                ),
                title
              ),
              children: children
            )
        ),
      ),
    );
  }
}