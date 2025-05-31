import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';

class ViewAnimalSummaryListtile extends StatelessWidget {
  final String leadingImgPath;
  final String title;
  final String subtitle;
  const ViewAnimalSummaryListtile({
    super.key,
    required this.leadingImgPath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 16, right: 0),
      leading: Image.asset(
        width: TSizes.iconxxl,
        leadingImgPath
      ),
      title: Text(
        style: Theme.of(context).textTheme.headlineSmall,
        title
      ),
      subtitle:  Text(
        subtitle
      ),
    );
  }
}