import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

/// Button widget for analyze image function
class AnalyzeImageButton extends StatefulWidget {
  /// Construct a new [AnalyzeImageButton] instance.
  const AnalyzeImageButton({required this.controller, super.key});

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

      final hasBarcode = barcodes != null && barcodes.barcodes.isNotEmpty;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(hasBarcode
              ? '✅ Barcode found!'
              : '❌ No barcode found.'),
          backgroundColor: hasBarcode ? Colors.green : Colors.red,
        ),
      );
    } catch (e) {
      debugPrint("Analyze image error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
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
