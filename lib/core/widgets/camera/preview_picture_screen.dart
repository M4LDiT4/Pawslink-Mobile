import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/widgets/navigation/generic_appbar.dart';

class PreviewPictureScreen extends StatelessWidget {
  final String imgPath;

  const PreviewPictureScreen({
    super.key,
    required this.imgPath
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GenericAppbar(),
      body: Image.file(
        File(imgPath)
      ),
    );
  }
}