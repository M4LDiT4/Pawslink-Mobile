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
        // Network image
        imageWidget = Image.network(
          path!,
          fit: fit,
          width: double.infinity,
          height: double.infinity,
          errorBuilder: (_, __, ___) {
            return Image.asset(fallbackAsset, fit: fit);
          },
        );
      } else if (File(path!).existsSync()) {
        // Local file
        imageWidget = Image.file(
          File(path!),
          fit: fit,
          width: double.infinity,
          height: double.infinity,
          errorBuilder: (_, __, ___) {
            return Image.asset(fallbackAsset, fit: fit);
          },
        );
      } else {
        // Not URL, not a valid file → fallback
        imageWidget = Image.asset(fallbackAsset, fit: fit);
      }
    } else {
      // Null or empty path → fallback
      imageWidget = Image.asset(fallbackAsset, fit: fit);
    }

    return SizedBox.expand(child: imageWidget);
  }
}
