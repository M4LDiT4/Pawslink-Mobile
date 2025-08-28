import 'dart:io';
import 'package:flutter/material.dart';

class SmartImage extends StatelessWidget {
  final String? path;
  final String fallbackAsset;
  final BoxFit fit;

  const SmartImage({
    super.key,
    this.path,
    required this.fallbackAsset,
    this.fit = BoxFit.cover,
  });

  bool _isUrl(String value) {
    final uri = Uri.tryParse(value);
    return uri != null && (uri.isScheme("http") || uri.isScheme("https"));
  }

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    if (path != null && path!.isNotEmpty) {
      if (_isUrl(path!)) {
        // Network image with loading + error handling
        imageWidget = Image.network(
          path!,
          fit: fit,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child; // Loaded
            return const Center(child: CircularProgressIndicator()); // Loading
          },
          errorBuilder: (_, __, ___) {
            return Image.asset(fallbackAsset, fit: fit);
          },
        );
      } else if (File(path!).existsSync()) {
        // Local file with error fallback
        imageWidget = Image.file(
          File(path!),
          fit: fit,
          errorBuilder: (_, __, ___) {
            return Image.asset(fallbackAsset, fit: fit);
          },
        );
      } else {
        // Invalid file path → fallback
        imageWidget = Image.asset(fallbackAsset, fit: fit);
      }
    } else {
      // Null or empty path → fallback
      imageWidget = Image.asset(fallbackAsset, fit: fit);
    }

    // Always fill parent
    return SizedBox.expand(child: imageWidget);
  }
}
