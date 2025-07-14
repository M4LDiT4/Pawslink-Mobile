import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class AspectRatioImage extends StatefulWidget {
  final ImageProvider image;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final Widget? placeholder;

  const AspectRatioImage({
    super.key,
    required this.image,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.placeholder,
  });

  factory AspectRatioImage.file(
    File file, {
    BoxFit fit = BoxFit.cover,
    BorderRadius? borderRadius,
    Widget? placeholder,
  }) {
    return AspectRatioImage(
      image: FileImage(file),
      fit: fit,
      borderRadius: borderRadius,
      placeholder: placeholder,
    );
  }

  @override
  State<AspectRatioImage> createState() => _AspectRatioImageState();
}

class _AspectRatioImageState extends State<AspectRatioImage> {
  double? _aspectRatio;

  @override
  void initState() {
    super.initState();
    _resolveImage();
  }

  void _resolveImage() {
    final imageStream = widget.image.resolve(const ImageConfiguration());
    final listener = ImageStreamListener((ImageInfo info, bool _) {
      final ui.Image img = info.image;
      final ratio = img.width / img.height;
      setState(() {
        _aspectRatio = ratio;
      });
    });
    imageStream.addListener(listener);
  }

  @override
  Widget build(BuildContext context) {
    if (_aspectRatio == null) {
      return widget.placeholder ??
          const Center(child: CircularProgressIndicator());
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = width / _aspectRatio!;
        return SizedBox(
          width: width,
          height: height,
          child: ClipRRect(
            borderRadius: widget.borderRadius ?? BorderRadius.zero,
            child: Image(
              image: widget.image,
              fit: widget.fit,
              width: width,
              height: height,
            ),
          ),
        );
      },
    );
  }
}
