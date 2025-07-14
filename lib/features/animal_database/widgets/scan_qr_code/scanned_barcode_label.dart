import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/constants/colors.dart';
import 'package:mobile_app_template/core/constants/sizes.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

/// Widget to display scanned barcodes.
class ScannedBarcodeLabel extends StatelessWidget {
  /// Construct a new [ScannedBarcodeLabel] instance.
  const ScannedBarcodeLabel({
    required this.barcodes,
    required this.handleOK,
    required this.handledCancel, 
    super.key,
  });
  final void Function() handleOK;
  final void Function() handledCancel;

  /// Barcode stream for scanned barcodes to display
  final Stream<BarcodeCapture> barcodes;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: barcodes,
      builder: (context, snapshot) {
        final List<Barcode> scannedBarcodes = snapshot.data?.barcodes ?? [];

        List<Widget> children = [
          const Text(
            style: TextStyle(
              color: TColors.textLight
            ),
            "Scan something"
          )
        ];

        if(scannedBarcodes.isNotEmpty){
          children = [
            IconButton(
              onPressed: (){}, 
              icon: const Icon(
                Icons.close,
                size: TSizes.iconxl,
                color: TColors.textLight,
              )
            ),
            IconButton(
              onPressed: (){}, 
              icon: const Icon(
                Icons.check,
                size: TSizes.iconxl,
                color: TColors.textLight,
              )
            )
          ];
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: children,
        );
      },
    );
  }
}
