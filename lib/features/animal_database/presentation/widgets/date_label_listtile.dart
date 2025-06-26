import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/utils/formatters/formatter.dart';

class DateLabelListtile extends StatelessWidget {
  final String label;
  final DateTime date;
  final IconData? iconData;

  const DateLabelListtile({
    required this.label,
    required this.date,
    this.iconData = Icons.circle,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        color: Theme.of(context).colorScheme.tertiary,
        iconData
      ),
      title: Text(label),
      subtitle: Text(TFormatter.formatDate(date)),
    );
  }
}