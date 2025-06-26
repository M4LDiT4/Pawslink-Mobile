import 'package:flutter/material.dart';

class ValueLabelColumn extends StatelessWidget {
  final String value;
  final String label;
  const ValueLabelColumn({
    super.key,
    required this.value,
    required this.label
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          FittedBox(
            child: Text(
            value.toUpperCase(),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          )
        ],
      )
    );
  }
}
