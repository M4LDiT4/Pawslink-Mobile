import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_app_template/core/widgets/composite/record_list_field/record_list_item.dart';

class RecordListTile extends StatelessWidget {
  final RecordListItem item;
  final IconData leadingIcon;
  final VoidCallback deleteFunction;
  final VoidCallback editFunction;
  const RecordListTile({
    super.key,
    required this.item,
    IconData? leadingIcon,
    required this.deleteFunction,
    required this.editFunction
  }): leadingIcon = leadingIcon?? Icons.circle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: ExpansionTile(
      title: Text(item.title),
      subtitle: Text(item.subTitle),
      leading: Icon(leadingIcon),
      trailing: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: deleteFunction, 
            icon: const Icon(
              Iconsax.trash,
              color: Colors.redAccent,
            )
          ),
          IconButton(
            onPressed: editFunction, 
            icon: Icon(
              Iconsax.edit,
              color: theme.colorScheme.primary,
            )
          )
        ],
      ),
    ),
    );
  }
}