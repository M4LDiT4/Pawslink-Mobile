import 'package:flutter/material.dart';

class InfoTooltip extends StatefulWidget {
  final String message;

  const InfoTooltip({super.key, required this.message});

  @override
  State<InfoTooltip> createState() => _InfoTooltipState();
}

class _InfoTooltipState extends State<InfoTooltip> {
  bool _showMessage = false;

  void _toggleMessage() {
    setState(() {
      _showMessage = !_showMessage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: _toggleMessage,
          child: Icon(
            Icons.help_outline,
            color: Colors.grey[700],
            size: 20,
          ),
        ),
        if (_showMessage)
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
            child: Text(
              widget.message,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              softWrap: true,
            ),
          ),
      ],
    );
  }
}
