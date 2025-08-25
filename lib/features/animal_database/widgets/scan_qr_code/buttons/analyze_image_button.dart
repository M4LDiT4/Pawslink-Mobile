import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_app_template/core/utils/helpers/ui_helpers.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

/// Button widget for analyze image function
class AnalyzeImageButton extends StatefulWidget {
  final Future<void> Function(List<Barcode>) onQRCodeDetected;
  /// Construct a new [AnalyzeImageButton] instance.
  const AnalyzeImageButton({required this.controller, required this.onQRCodeDetected, super.key});

  /// Controller which is used to call analyzeImage
  final MobileScannerController controller;

  @override
  State<AnalyzeImageButton> createState() => _AnalyzeImageButtonState();
}

class _AnalyzeImageButtonState extends State<AnalyzeImageButton> {
  bool _isPicking = false;

  Future<void> _onPressed(BuildContext context) async {
    if (_isPicking) return;

    setState(() => _isPicking = true);

    try {
      if (kIsWeb) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Analyze image is not supported on web'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      final picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final BarcodeCapture? barcodes =
          await widget.controller.analyzeImage(image.path);

      if (!context.mounted) return;

      if (barcodes != null && barcodes.barcodes.isNotEmpty) {
        await widget.onQRCodeDetected(barcodes.barcodes);
      } else {
        TUIHelpers.showStateSnackBar("No QR Codes detected on the image");
      }
    } catch (e) {
      TLogger.error("Analyze image error: $e");
      TUIHelpers.showStateSnackBar(
        "Error occured while analyzing image",
        state: SnackBarState.error
      );
    } finally {
      if (mounted) setState(() => _isPicking = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: Colors.white,
      iconSize: 32,
      tooltip: 'Analyze from Gallery',
      icon: _isPicking
          ? const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
            )
          : const Icon(Icons.image),
      onPressed: () => _onPressed(context),
    );
  }
}
