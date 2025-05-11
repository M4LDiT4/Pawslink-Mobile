import 'package:flutter/material.dart';

// Enum for separator orientation
enum SeparatorOrientation { vertical, horizontal }

// FixedSeparator widget
class FixedSeparator extends StatelessWidget {
  final double space;
  final SeparatorOrientation orientation;

  // Constructor to take space and orientation as arguments
  const FixedSeparator({
    super.key,
    required this.space,
    this.orientation = SeparatorOrientation.vertical, // Default is vertical
  });

  @override
  Widget build(BuildContext context) {
    // Return either a vertical or horizontal separator based on orientation
    if (orientation == SeparatorOrientation.vertical) {
      return SizedBox(height: space); // Vertical separator
    } else {
      return SizedBox(width: space); // Horizontal separator
    }
  }
}
